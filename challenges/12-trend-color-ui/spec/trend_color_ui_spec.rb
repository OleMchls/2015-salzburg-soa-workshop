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
    expect(last_response.body).to include 'data-color-name="Toasted Almond"'
    expect(last_response.body).to include 'data-color-value="#D2B29A"'
    expect(last_response.body).to include 'data-color-name="Aquamarine"'
    expect(last_response.body).to include 'data-color-value="#9DC6D8"'
  end

  it 'should have only colors from queried year' do
    get '/', from: 2015, to: 2015

    expect(last_response.body).not_to include 'data-color-name="Tangerine"'
    expect(last_response.body).not_to include 'data-color-value="#F79256"'
    expect(last_response.body).not_to include 'data-color-name="Toasted Almond"'
    expect(last_response.body).not_to include 'data-color-value="#D2B29A"'
    expect(last_response.body).to include 'data-color-name="Aquamarine"'
    expect(last_response.body).to include 'data-color-value="#9DC6D8"'
  end

  it 'should have only colors from queried year' do
    get '/', from: 2014, to: 2015

    expect(last_response.body).not_to include 'data-color-name="Tangerine"'
    expect(last_response.body).not_to include 'data-color-value="#F79256"'
    expect(last_response.body).to include 'data-color-name="Toasted Almond"'
    expect(last_response.body).to include 'data-color-value="#D2B29A"'
    expect(last_response.body).to include 'data-color-name="Aquamarine"'
    expect(last_response.body).to include 'data-color-value="#9DC6D8"'
  end
end
