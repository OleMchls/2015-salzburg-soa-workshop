ENV['RACK_ENV'] = 'test'

require 'json'
require 'rspec'
require 'rack/test'

describe 'Trend Color API' do
  include Rack::Test::Methods

  def app
    ### STUDENTS: make this method return your Rack-based app
  end

  def body
    JSON.parse(last_response.body)
  end

  it 'should return the trend color for the current year' do
    get '/colors/trends'

    expect(last_response).to be_ok
    expect(body).to eq [
      { 'name' => 'Aquamarine',    'hex' => '#9DC6D8', 'complement' => '#D8AF9D' },
      { 'name' => 'Scuba Blue',    'hex' => '#00B2CA', 'complement' => '#CA1700' },
      { 'name' => 'Lucite® Green', 'hex' => '#7DCFB6', 'complement' => '#CF7C95' }
    ]
  end

  context 'trend colors by year' do
    it 'should return the trend colors for 2014' do
      get '/colors/trends/2013'

      expect(last_response).to be_ok
      expect(body).to eq [
        { 'name' => 'Tangerine', 'hex' => '#F79256', 'complement' => '#56BBF7' },
        { 'name' => 'Custard', 'hex' => '#EAD98B', 'complement' => '#8A9BE9' },
        { 'name' => 'Marsala', 'hex' => '#955251', 'complement' => '#519395' }
      ]
    end

    it 'should return the trend colors for 2014' do
      get '/colors/trends/2014'

      expect(last_response).to be_ok
      expect(body).to eq [
        { 'name' => 'Classic Blue',   'hex' => '#1D4E89', 'complement' => '#88571C' },
        { 'name' => 'Toasted Almond', 'hex' => '#D2B29A', 'complement' => '#99B9D1' },
        { 'name' => 'Strawberry Ice', 'hex' => '#E3868F', 'complement' => '#85E2DA' }
      ]
    end
  end
end
