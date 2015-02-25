ENV['RACK_ENV'] = 'test'

require 'json'
require 'rspec'
require 'rack/test'

require_relative '../lib/trend_color_api'

describe 'Trend Color API' do
  include Rack::Test::Methods

  def app
    TrendColorApi.new
  end

  def body
    JSON.parse(last_response.body)
  end

  it 'should return the trend color for the current year' do
    get '/colors/trends'

    expect(last_response).to be_ok
    expect(body).to eq [
      { 'name' => 'Aquamarine',     'hex' => '#9DC6D8' },
      { 'name' => 'Scuba Blue',     'hex' => '#00B2CA' },
      { 'name' => 'Lucite® Green',  'hex' => '#7DCFB6' }
    ]
  end

  context 'trend colors by year' do
    it 'should return the trend colors for 2014' do
      get '/colors/trends/2013'

      expect(last_response).to be_ok
      expect(body).to eq [
        { 'name' => 'Tangerine', 'hex' => '#F79256' },
        { 'name' => 'Custard', 'hex' => '#EAD98B' },
        { 'name' => 'Marsala', 'hex' => '#955251' }
      ]
    end

    it 'should return the trend colors for 2014' do
      get '/colors/trends/2014'

      expect(last_response).to be_ok
      expect(body).to eq [
        { 'name' => 'Classic Blue',   'hex' => '#1D4E89' },
        { 'name' => 'Toasted Almond', 'hex' => '#D2B29A' },
        { 'name' => 'Strawberry Ice', 'hex' => '#E3868F' }
      ]
    end
  end
end
