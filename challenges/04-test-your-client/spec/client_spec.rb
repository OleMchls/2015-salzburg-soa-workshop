require_relative '../../03-mini-http-server/lib/client.rb'

RSpec.describe 'Client integration testing' do
  before(:all) do
    @pid = Process.fork do
      Dir.chdir(File.expand_path("../../", __FILE__))
      exec "bundle exec rackup -p 9292 -o 0.0.0.0"
    end
    sleep 5
  end

  after(:all) do
    Process.kill "INT", @pid
    Process.wait
  end

  it "fetches both endpoints correctly" do
    client = Client.new '127.0.0.1', 9292
    expect(client.fetch('/hello')).to eq "World"

    # create a new client in case the client is single-request only
    client = Client.new '127.0.0.1', 9292
    expect(client.fetch('/hello/salzburg')).to eq "Servus!"
  end
end
