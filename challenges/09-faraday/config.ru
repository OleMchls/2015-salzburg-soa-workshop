require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../../08-rest-ftp-hateoas/lib/file_server', __FILE__)

run FileServer.new
