require 'socket'

class BasicUdpServer
  attr_reader :received_messages

  def initialize(port:)
    @socket = UDPSocket.new
    @socket.bind("127.0.0.1", port)

    @received_messages = []

    @stop = false
    @stop_io_reader, @stop_io_writer = IO.pipe

    @thread = Thread.new {
      wait_for_messages while !@stop
    }
  end

  def stop!
    @stop = true
    @stop_io_writer.puts
    @thread.join
    @socket.close
  end

  protected
  def wait_for_messages
    IO.select([@socket, @stop_io_reader])
    return if @stop
    message, sender = @socket.recvfrom(65536)
    p "Received '#{message}' from #{sender[2]}"
    @received_messages << message
  end
end
