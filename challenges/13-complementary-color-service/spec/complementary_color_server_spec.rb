ENV['RACK_ENV'] = 'test'

require 'json'
require 'rspec'
require 'rack/test'

require_relative '../lib/complementary_color_server'

describe 'Complementary Color API' do
  include Rack::Test::Methods

  def app
    ComplementaryColorServer.new
  end

  def body
    JSON.parse last_response.body
  end

  it 'should return the complementary color for a given color' do
    get '/complement', color: '#5EA1EB'
    expect(body).to have_key 'complement'
    expect(body['complement']).to eq '#EAA85D'
  end

  it 'should also work with hex without a hash' do
    get '/complement', color: 'BADA55'
    expect(body).to have_key 'complement'
    expect(body['complement']).to eq '#7555DA'
  end

  it 'should return HTTP 422 UNPROCESSABLE ENTITY when provided with non-hex value' do
    get '/complement', color: 'BADAGG'
    expect(last_response.status).to eq 422
  end
end
