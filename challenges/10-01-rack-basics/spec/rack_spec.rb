require 'rack/test'
require_relative '../lib/app'

describe App do
  include Rack::Test::Methods

  let(:app) { App.new }

  before do
    get '/'
  end

  it "returns 'Hello World'" do
    expect(last_response.body).to eq 'Hello World'
  end

  it "returns status code 200" do
    expect(last_response.status).to be 200
  end
end
