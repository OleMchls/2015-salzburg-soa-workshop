require_relative '../lib/client.rb'

RSpec.describe Client do
  let(:client) { Client.new 'slidr.io', 80 }

  describe '#fetch' do
    it 'fetch html' do
      expect(client.fetch('/')).to include '<!DOCTYPE html>'
    end
  end
end
