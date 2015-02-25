require 'rubygems'
require 'bundler'
Bundler.require

require File.expand_path('../lib/trend_colors_ui', __FILE__)

run TrendColorsUi.new
