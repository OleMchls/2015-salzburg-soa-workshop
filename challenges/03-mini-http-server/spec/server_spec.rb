require 'net/http'

describe 'webserver' do
  let(:url) { URI 'http://localhost:9292/' }

  it 'should listen on port 9292' do
    expect(Net::HTTP.get(url))
  end

  it 'should return HTTP 200 OK' do
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.new(url.host, url.port).start { |http| http.request(req) }
    expect(res).to be_a Net::HTTPOK
  end

  it 'should work correctly with additional headers' do
    req = Net::HTTP::Get.new(url.path)
    req.add_field('X-Forwarded-For', '0.0.0.0')
    req.add_field('Accept', '*/*')

    res = Net::HTTP.new(url.host, url.port).start { |http| http.request(req) }

    expect(res).to be_a Net::HTTPOK
  end

  it 'should return <h1>Ok</h1>' do
    expect(Net::HTTP.get(url)).to include '<h1>Ok</h1>'
  end
end
