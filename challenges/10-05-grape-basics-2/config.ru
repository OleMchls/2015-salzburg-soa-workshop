require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/file_server', __FILE__)

run FileServer.new
