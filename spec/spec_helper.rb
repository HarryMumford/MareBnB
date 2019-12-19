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
require_relative 'helpers/approval_test_setup'
require_relative 'helpers/register_log_in'
require_relative 'helpers/listing_space'
require_relative 'setup_test_database'

Capybara.app = MareBnB
Capybara.server = :webrick
Capybara.default_max_wait_time = 15

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.backtrace_exclusion_patterns = [/gem/]
end
