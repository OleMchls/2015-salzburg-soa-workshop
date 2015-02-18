ENV['RACK_ENV'] = 'test'

require 'json'
require 'rspec'
require 'rack/test'

describe 'Complementary Color API' do
  include Rack::Test::Methods

  def app
    ### STUDENTS: make this method return your Rack-based app
  end

  it 'should return the complementary color for a given color' do
    get '/complement', color: '#5EA1EB'
    expect(last_response.body).to eq '#EAA85D'
  end

  it 'should also work with hex without a hash' do
    get '/complement', color: 'BADA55'
    expect(last_response.body).to eq '#7555DA'
  end

  it 'should return HTTP 422 UNPROCESSABLE ENTITY when provided with non-hex value' do
    get '/complement', color: 'BADAGG'
    expect(last_response.status).to eq 422
  end
end