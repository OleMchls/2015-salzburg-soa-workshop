require 'rack/test'
require_relative '../lib/app'

describe App do
  include Rack::Test::Methods

  let(:app) { App.new }

  describe "/hello" do
    before do
      get '/hello'
    end

    it "returns status 200" do
      expect(last_response.status).to be 200
    end

    it "has a 'Hello' body" do
      expect(last_response.body).to eq 'Hello'
    end
  end

  describe "/world" do
    before do
      get '/world'
    end

    it "returns status 200" do
      expect(last_response.status).to be 200
    end

    it "has a 'World' body" do
      expect(last_response.body).to eq 'World'
    end
  end

  describe "random url" do
    before do
      get "/something-else"
    end

    it "returns status 404" do
      expect(last_response.status).to be 404
    end

    it "has a 'Not Found' body" do
      expect(last_response.body).to eq 'Not Found'
    end
  end
end
