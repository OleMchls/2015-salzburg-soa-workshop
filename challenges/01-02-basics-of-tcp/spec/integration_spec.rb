require_relative '../lib/basic_tcp_server.rb'
require_relative '../lib/basic_tcp_server_connection.rb'
require_relative '../lib/basic_tcp_client.rb'

RSpec.describe BasicTcpServer do
  before do
    Thread.abort_on_exception = true
  end

  it "receives all messages" do
    server = BasicTcpServer.new(port: 32001)
    client1 = BasicTcpClient.new(host: "127.0.0.1", port: 32001)
    client2 = BasicTcpClient.new(host: "127.0.0.1", port: 32001)

    client1.send_message("Oha!")
    client2.send_message("Lala!")
    client1.send_message("That's it")

    sleep 0.1
    server.stop!

    expect(server.received_messages.sort).to eq ["Lala!", "Oha!That's it"]
  end
end
