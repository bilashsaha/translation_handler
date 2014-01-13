ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
RSpec.configure do |config|
  config.mock_with :rspec
end