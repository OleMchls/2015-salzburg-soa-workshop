require 'rack/test'
require_relative '../lib/app'
require_relative '../lib/middleware'

describe Middleware do
  include Rack::Test::Methods

  let(:app) {
    Rack::Builder.new {
      use Middleware
      run App.new
    }
  }

  context 'unauthorized' do
    describe "/hello" do
      before do
        get '/hello'
      end

      it "returns status 401" do
        expect(last_response.status).to be 401
      end

      it "has no 'World' body" do
        expect(last_response.body).not_to eq 'World'
      end
    end

    describe "/world" do
      before do
        get '/world'
      end

      it "returns status 401" do
        expect(last_response.status).to be 401
      end

      it "has no 'Hello' body" do
        expect(last_response.body).not_to eq 'Hello'
      end
    end
  end

  context 'authorized with wrong credentials' do
    before do
      basic_authorize('paul', 'hitchcock')
    end

    describe "/hello" do
      before do
        get '/hello'
      end

      it "returns status 403" do
        expect(last_response.status).to be 403
      end

      it "has no 'World' body" do
        expect(last_response.body).not_to eq 'World'
      end
    end

    describe "/world" do
      before do
        get '/world'
      end

      it "returns status 403" do
        expect(last_response.status).to be 403
      end

      it "has no 'Hello' body" do
        expect(last_response.body).not_to eq 'Hello'
      end
    end
  end

  context 'correctly authorized' do
    before do
      basic_authorize('alfred', 'hitchcock')
    end

    describe "/hello" do
      before do
        get '/hello'
      end

      it "returns status 200" do
        expect(last_response.status).to be 200
      end

      it "has a 'World' body" do
        expect(last_response.body).to eq 'World'
      end
    end

    describe "/world" do
      before do
        get '/world'
      end

      it "returns status 200" do
        expect(last_response.status).to be 200
      end

      it "has a 'Hello' body" do
        expect(last_response.body).to eq 'Hello'
      end
    end
  end
end
