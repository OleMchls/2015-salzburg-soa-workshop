require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/trend_colors_api', __FILE__)

run TrendColorsApi.new
