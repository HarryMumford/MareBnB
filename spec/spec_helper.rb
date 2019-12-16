ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'pg'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

require_relative '../app'
require_relative 'setup_test_database'

Capybara.app = MareBnB

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.backtrace_exclusion_patterns = [/gem/]
end
