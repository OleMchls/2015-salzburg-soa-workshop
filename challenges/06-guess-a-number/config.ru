require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/number_server', __FILE__)

run NumberServer.new
