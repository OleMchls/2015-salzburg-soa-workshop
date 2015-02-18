ENV['RACK_ENV'] = 'test'

require 'json'
require 'rspec'
require 'rack/test'

describe 'Trend Color UI' do
  include Rack::Test::Methods

  def app
    ### STUDENTS: make this method return your Rack-based app
  end

  it 'should have all trend colors' do
    get '/'

    expect(last_response).to be_ok

    expect(last_response.body).to include '<!DOCTYPE html>'

    expect(last_response.body).to include 'data-color-name="Tangerine"'
    expect(last_response.body).to include 'data-color-value="#F79256"'
    expect(last_response.body).to include 'data-color-complementary="#56BBF7"'

    expect(last_response.body).to include 'data-color-name="Toasted Almond"'
    expect(last_response.body).to include 'data-color-value="#D2B29A"'
    expect(last_response.body).to include 'data-color-complementary="#99B9D1"'

    expect(last_response.body).to include 'data-color-name="Aquamarine"'
    expect(last_response.body).to include 'data-color-value="#9DC6D8"'
    expect(last_response.body).to include 'data-color-complementary="#D8AF9D"'
  end
end
