require 'socket'

class FileClient
  class FileNotFoundError < StandardError; end
  class ServerError < StandardError; end

  def initialize host, port
    @host = host
    @port = port
  end

  def read_file(path)
    response = request(method: 'GET', path: path)

    ensure_file_was_found!(response)
    ensure_request_was_successful!(response)

    response[:body]
  end

  def read_directory(path)
    read_file(path).split("\r\n")
  end

  def write_file(path, content:)
    response = request(method: 'PUT', path: path, data: content)

    ensure_request_was_successful!(response)

    true
  end

  def delete_file(path)
    response = request(method: 'DELETE', path: path)

    ensure_file_was_found!(response)
    ensure_request_was_successful!(response)

    true
  end

  protected
  def ensure_file_was_found!(response)
    raise FileNotFoundError.new if response[:status_code] == 404
  end

  def ensure_request_was_successful!(response)
    if response[:status_code] != 200
      raise ServerError.new("Response code: #{response[:status_code]}")
    end
  end

  def request(method:, path:, data: nil)
    connection = TCPSocket.new @host, @port

    path = "/#{path}" unless path.start_with?('/')

    send_request(connection: connection, method: method, path: path, data: data)

    status_code = get_status_code(connection: connection)

    headers = get_headers(connection: connection)

    body = get_body(connection: connection, headers: headers)

    {status_code: status_code, body: body, headers: headers}
  end

  def send_request(connection:, method:, path:, data:)
    connection.write "#{method} #{path} HTTP/1.1\r\n"
    connection.write "Host: #{@host}:#{@port}\r\n"
    if data
      connection.write "Content-Length: #{data.bytes.size}\r\n"
    end

    connection.write "\r\n"

    if data
      connection.write data
    end
  end

  def get_status_code(connection:)
    http_line = connection.gets
    http_version, status_code, reason_phrase = http_line.split(' ')
    status_code.to_i
  end

  def get_headers(connection:)
    headers = {}
    while header_line = connection.gets
      break if header_line == "\r\n"
      header_elements = header_line.split(':')
      key = header_elements.shift
      key = key.strip.chomp
      value = header_elements.join(':').strip.chomp

      headers[key.upcase] = value
    end

    headers
  end

  def get_body(connection:, headers:)
    body = nil
    if headers['CONTENT-LENGTH'] && (content_length = headers['CONTENT-LENGTH'].to_i) > 0
      body = connection.read(content_length)
    end
    body
  end
end
