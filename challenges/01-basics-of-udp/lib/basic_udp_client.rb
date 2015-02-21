require 'socket'
require 'thread'

class BasicUdpClient
  def initialize(host:, port:)
    @socket = UDPSocket.new
    @host = host
    @port = port
  end

  def send_message(message)
    @socket.send message, 0, @host, @port
  end
end
