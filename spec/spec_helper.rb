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
require_relative 'web_helpers.rb'
require_relative 'helpers/register_log_in'

Capybara.app = MareBnB

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.backtrace_exclusion_patterns = [/gem/]
end
