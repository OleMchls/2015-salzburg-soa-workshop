require 'faraday'
require_relative '../../08-rest-ftp-hateoas/lib/link_header'

class FileClient
  class FileNotFoundError < StandardError; end
  class ServerError < StandardError; end

  def initialize(url)
    @connection = Faraday.new(:url => url)
  end

  def read_file(path)
    response = read_file_or_directory(path: path)

    response.body
  end

  def read_directory(path)
    files = []
    stop = false

    while !stop
      response = read_file_or_directory(path: path)
      files += response.body.split("\r\n")

      if link_header = response.headers['link']
        links = LinkHeader.parse(link_header)
        if links['next']
          uri = URI.parse(links['next'].url)
          path = "#{uri.path}"
          path += "?#{uri.query}" if uri.query
        else
          stop = true
        end
      else
        stop = true
      end
    end

    files
  end

  def write_file(path, content:)
    response = @connection.put do |request|
      request.url path
      request.body = content
    end

    ensure_request_was_successful!(response)

    true
  end

  def delete_file(path)
    response = @connection.delete(path)

    ensure_file_was_found!(response)
    ensure_request_was_successful!(response)

    true
  end

  protected
  def ensure_file_was_found!(response)
    raise FileNotFoundError.new if response.status == 404
  end

  def ensure_request_was_successful!(response)
    if response.status != 200
      raise ServerError.new("Response code: #{response.status}")
    end
  end

  def read_file_or_directory(path:)
    response = @connection.get(path)

    ensure_file_was_found!(response)
    ensure_request_was_successful!(response)

    response
  end
end
