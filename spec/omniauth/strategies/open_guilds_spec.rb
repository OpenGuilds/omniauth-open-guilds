require 'spec_helper'

RSpec.describe OmniAuth::Strategies::OpenGuilds do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:options){ {} }
  let(:app) { lambda{|env| [200, {}, ["Hello World."]]} }

  let(:result) {
    OmniAuth::Strategies::OpenGuilds.new(app, options).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  }

  describe 'client options' do
    it 'should have correct name' do
      expect(result.options.name).to eq(:open_guilds)
    end

    it 'should have correct site' do
      expect(result.options.client_options.site).to eq('https://dashboard.openguilds.com')
    end

    it 'should have correct authorize url' do
      expect(result.options.client_options.authorize_path).to eq('/oauth/authenticate')
    end
  end

  describe 'custom client options' do
    let(:options) { 
      { 
        client_options: { site: 'https://testing.openguilds.com' }
      } 
    }

    it 'should have correct site' do
      expect(result.options.client_options.site).to eq('https://testing.openguilds.com')
    end
  end


  describe 'info' do
    before do
      allow(result).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should returns the name' do
      expect(result.info[:name]).to eq(raw_info_hash['name'])
    end

    it 'should returns the email' do
      expect(result.info[:email]).to eq(raw_info_hash['email'])
    end
  end
end

private

def raw_info_hash
  {
    'name' => 'Foo Bar',
    'email' => 'foo@example.com',
  }
end
