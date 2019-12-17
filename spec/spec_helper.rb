ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'pg'
require 'selenium-webdriver'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

require_relative '../app'
require_relative 'setup_test_database'
require_relative 'helpers/register_log_in'
require_relative 'helpers/listing_space'

Capybara.app = MareBnB
Capybara.default_driver = :selenium
Capybara.server = :webrick

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.backtrace_exclusion_patterns = [/gem/]
end
