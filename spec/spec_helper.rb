$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

if RUBY_VERSION >= '2.6.0'
  require 'simplecov'
  SimpleCov.start
end

require 'rspec'
require 'rack/test'
require 'webmock/rspec'

require 'omniauth'
require 'omniauth-figma-oauth2'

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, :type => :strategy
end
