require_relative '../lib/basic_udp_server.rb'
require_relative '../lib/basic_udp_client.rb'

RSpec.describe BasicUdpServer do
  before do
    Thread.abort_on_exception = true
  end

  it "receives all messages" do
    server = BasicUdpServer.new(port: 32001)
    client = BasicUdpClient.new(host: "127.0.0.1", port: 32001)

    client.send_message("Oha!")
    client.send_message("Lala!")
    client.send_message("That's it")

    sleep 0.1
    server.stop!

    expect(server.received_messages).to eq ["Oha!", "Lala!", "That's it"]
  end
end
