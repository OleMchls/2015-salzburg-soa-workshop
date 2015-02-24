require 'faraday'
require_relative '../../08-rest-ftp-hateoas/lib/link_header'

class FileClient
  class FileNotFoundError < StandardError; end
  class ServerError < StandardError; end

  def initialize(url)
    # important: this method does now only take one argument instead of two!
  end

  def read_file(path)
  end

  def read_directory(path)
  end

  def write_file(path, content:)
  end

  def delete_file(path)
  end
end
