require_relative '../../01-01-basics-of-udp/lib/basic_udp_server.rb'
require_relative '../../01-01-basics-of-udp/lib/basic_udp_client.rb'

require_relative '../../01-02-basics-of-tcp/lib/basic_tcp_server.rb'
require_relative '../../01-02-basics-of-tcp/lib/basic_tcp_server_connection.rb'
require_relative '../../01-02-basics-of-tcp/lib/basic_tcp_client.rb'

require "benchmark"

# How many packets does each client send
PACKETS_TO_SEND  = 10_000

RSpec.describe 'Compare TCP and UDP' do
  before do
    Thread.abort_on_exception = true
  end

  def packets_received_by_tcp_server(server, message_length:)
    server.received_messages.flatten.join('').size / message_length
  end

  def wait_for_first_message_to_arrive(&message_count_blck)
    sleep 0.00001 while message_count_blck.call == 0
  end

  def wait_for_all_messages_to_arrive(&message_count_blck)
    old_count = message_count_blck.call

    # the received packet count delta of the 5 last loops
    deltas = [-1, -1, -1, -1, -1]

    # Loop until we receive no change in received packet cound 5 times in a row
    # Also check of there any packets have been received yet and do not stop before packets have started to trickle in.
    while deltas != [0, 0, 0, 0, 0] || old_count == 0
      delta = message_count_blck.call - old_count
      old_count += delta
      deltas << delta
      deltas = deltas[-5..-1]
      sleep 0.0001
    end
  end

  def benchmark_message_sending(send_message:, message_count:)
    Process.fork do
      PACKETS_TO_SEND.times do
        send_message.call
        sleep 0.000001
      end
    end

    wait_for_first_message_to_arrive(&message_count)

    Benchmark.realtime do
      wait_for_all_messages_to_arrive(&message_count)
    end
  end

  def print_benchmark(type:, time_taken:, messages_received:)
    puts "\n#{type} took #{time_taken} seconds to receive #{messages_received} packets. ~#{(messages_received / time_taken).to_i} packets/second. #{(messages_received / PACKETS_TO_SEND.to_f) * 100}% of packets received.\n\n"
  end

  it "sends #{PACKETS_TO_SEND} messages using UDP" do
    server = BasicUdpServer.new(port: 32001)
    client = BasicUdpClient.new(host: "127.0.0.1", port: 32001)

    time = benchmark_message_sending(
        send_message:  -> {
          client.send_message("UDP!")
        },
        message_count: -> { server.received_messages.size }
    )

    server.stop!
    print_benchmark(type: 'UDP', time_taken: time, messages_received: server.received_messages.size)
  end

  it "sends #{PACKETS_TO_SEND} messages using TCP" do
    server = BasicTcpServer.new(port: 32001)
    client = BasicTcpClient.new(host: "127.0.0.1", port: 32001)

    time = benchmark_message_sending(
        send_message:  -> {
          client.send_message("TCP!")
        },
        message_count: -> { packets_received_by_tcp_server(server, message_length: 4) }
    )

    server.stop!
    print_benchmark(type: 'TCP', time_taken: time, messages_received: packets_received_by_tcp_server(server, message_length: 4))
  end

end
