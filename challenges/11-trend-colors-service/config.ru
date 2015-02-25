require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/trend_color_api', __FILE__)

run TrendColorApi.new
