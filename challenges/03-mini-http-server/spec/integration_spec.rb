require_relative '../lib/client.rb'

RSpec.describe Client do
  let(:client) { Client.new 'localhost', 9292 }

  describe '#fetch' do
    it 'should work with the server you just wrote' do
      expect(client.fetch('/')).to include 'OK'
    end
  end
end
