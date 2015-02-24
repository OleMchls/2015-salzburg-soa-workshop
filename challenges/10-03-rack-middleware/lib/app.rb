require 'sinatra/base'

class App < Sinatra::Base
  get '/hello' do
    'World'
  end

  get '/world' do
    'Hello'
  end
end
