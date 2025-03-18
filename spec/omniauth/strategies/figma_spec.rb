require 'spec_helper'

describe OmniAuth::Strategies::Figma do
  subject { OmniAuth::Strategies::Figma.new(nil) }

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe '#client' do
    it 'has correct Figma site' do
      expect(subject.client.site).to eq('https://api.figma.com/v1/')
    end

    it 'has correct `authorize_url`' do
      expect(subject.client.options[:authorize_url]).to eq('https://www.figma.com/oauth')
    end

    it 'has correct `token_url`' do
      expect(subject.client.options[:token_url]).to eq('oauth/token')
    end
  end

end
