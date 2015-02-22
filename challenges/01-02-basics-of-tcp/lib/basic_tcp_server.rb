require 'socket'

class BasicTcpServer
  attr_reader :received_messages

  def initialize(port:)
    @server = TCPServer.open(port)

    @received_messages = []

    @stop = false
    @stop_io_reader, @stop_io_writer = IO.pipe

    @connections = []

    @accept_thread = Thread.new {
      wait_for_clients while !@stop
    }
  end

  def stop!
    @stop = true
    @stop_io_writer.puts
    @accept_thread.join
    @connections.each do |connection|
      connection.stop!
    end
    @server.close
  end

  protected
  def wait_for_clients
    IO.select([@server, @stop_io_reader])
    return if @stop
    socket = @server.accept
    puts "New connection from: #{socket.peeraddr.inspect}"
    @connections << BasicTcpServerConnection.new(server: self, socket: socket)
  end
end
