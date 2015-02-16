require 'socket'

server = TCPServer.new 9292 # Server bind to port 9292

loop do
  client = server.accept    # Wait for a client to connect

  client.close
end
