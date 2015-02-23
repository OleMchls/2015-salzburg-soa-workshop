require_relative '../lib/guess_a_number_client.rb'

RSpec.describe GuessANumberClient do
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

  let(:client) { GuessANumberClient.new '127.0.0.1', 9292 }

  before do
    expect(client.set_number(50)).to be true
  end

  it "indicates when guessed too low" do
    expect(client.guess(49)).to be false
    expect(client.last_guess).to be :too_low
  end

  it "indicates when guessed too height" do
    expect(client.guess(51)).to be false
    expect(client.last_guess).to be :too_high
  end

  it "indicates when guessed correctly" do
    expect(client.guess(50)).to be true
    expect(client.last_guess).to be :correct
  end
end
