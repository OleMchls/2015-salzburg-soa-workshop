require 'socket'
require 'io/wait'

class BasicTcpServerConnection
  def initialize(server:, socket:)
    @server = server
    @socket = socket

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
    data_received @socket.read(@socket.nread)
  end

  def data_received(data)
    # puts "Received '#{data}' from #{@socket.peeraddr[2]}"
    @server.received_messages << data
  end
end
