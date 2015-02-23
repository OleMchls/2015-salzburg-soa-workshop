require_relative '../lib/client.rb'

RSpec.describe 'Client redirection' do
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
    expect(client.fetch('/hello')).to eq "Servus!"
  end
end
