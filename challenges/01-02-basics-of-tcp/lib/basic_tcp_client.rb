require 'socket'
require 'thread'

class BasicTcpClient
  def initialize(host:, port:)
    @socket = TCPSocket.open(host, port)
  end

  def send_message(message)
    @socket.write message
  end
end
