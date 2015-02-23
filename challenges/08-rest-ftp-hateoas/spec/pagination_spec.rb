require_relative '../lib/file_client.rb'
require_relative '../lib/file_server.rb'
require 'fileutils'

RSpec.describe FileServer do
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

  let(:client) { FileClient.new '127.0.0.1', 9292 }

  def files_path
    File.expand_path('../../files', __FILE__)
  end

  def clean_up_files!
    FileUtils.rm_rf(files_path)
    FileUtils.mkdir_p(File.join(files_path, 'blub'))
  end

  before do
    clean_up_files!

    FileUtils.touch 53.times.map { |i| File.join(files_path, 'blub', "%03d.txt" % i) }
  end

  after do
    clean_up_files!
  end

  it "retrieves all files" do
    files = 53.times.map { |i| "blub/%03d.txt" % i }

    expect(client.read_directory('blub')).to eq files
  end
end
