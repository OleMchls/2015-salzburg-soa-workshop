require 'sinatra'
require 'json'
require_relative './trend_colors_client'

class TrendColorsUi < Sinatra::Base
  get '/' do  
    erb :index
  end
end
