require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/todo_api', __FILE__)

run TodoApi.new
