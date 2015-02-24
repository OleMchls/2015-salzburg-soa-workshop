require_relative '../lib/file_client.rb'
require_relative '../../08-rest-ftp-hateoas/lib/file_server.rb'
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

  let(:client) { FileClient.new('http://127.0.0.1:9292') }

  def files_path
    File.expand_path('../../files', __FILE__)
  end

  def clean_up_files!
    FileUtils.rm_rf(files_path)
    FileUtils.mkdir_p(files_path)
  end

  before do
    clean_up_files!
  end

  after do
    clean_up_files!
  end

  it "can create files" do
    expected_file_path = File.join(files_path, 'bla/blub')

    expect {
      client.write_file('bla/blub', content: "My\ncool\nfile!")
    }.to change { File.exist?(expected_file_path) }.from(false).to(true)

    expect(File.read(expected_file_path)).to eq "My\ncool\nfile!"
  end

  context "with files" do
    before do
      File.write(File.join(files_path, 'root.txt'), 'The root of all files')

      FileUtils.mkdir_p(File.join(files_path, 'bla'))
      File.write(File.join(files_path, 'bla/1.txt'), 'File 1')
      File.write(File.join(files_path, 'bla/2.txt'), 'File 2')
    end

    it "can read a file" do
      expect(client.read_file('root.txt')).to eq "The root of all files"
      expect(client.read_file('bla/2.txt')).to eq "File 2"
    end

    it "raises a FileNotFoundError when reading a non existing file" do
      expect { client.read_file('bla/3.txt') }.to raise_error(FileClient::FileNotFoundError)
    end

    it "can read a directory" do
      expect(client.read_directory('/').sort).to eq ['root.txt', 'bla'].sort
    end

    it "raises a FileNotFoundError when reading a non existing directory" do
      expect { client.read_directory('blub') }.to raise_error(FileClient::FileNotFoundError)
    end

    it "can delete a file" do
      expected_file_path = File.join(files_path, 'bla/1.txt')

      expect {
        client.delete_file('bla/1.txt')
      }.to change { File.exist?(expected_file_path) }.from(true).to(false)
    end

    it "raises a FileNotFoundError when deleting a non existing file" do
      expect { client.delete_file('bla/3.txt') }.to raise_error(FileClient::FileNotFoundError)
    end
  end

  context "with a lot of files" do
    before do
      FileUtils.mkdir_p(File.join(files_path, 'blub'))
      FileUtils.touch 53.times.map { |i| File.join(files_path, 'blub', "%03d.txt" % i) }
    end

    it "retrieves all files" do
      files = 53.times.map { |i| "blub/%03d.txt" % i }

      expect(client.read_directory('blub')).to eq files
    end
  end
end
