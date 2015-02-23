require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/test_server', __FILE__)

run Server.new
