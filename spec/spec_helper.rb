ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'selenium-webdriver'
require 'pg'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

require_relative '../app'
require_relative 'helpers/approval_test_setup'
require_relative 'helpers/register_log_in'
require_relative 'helpers/listing_space'

Capybara.app = MareBnB
Capybara.server = :webrick
Capybara.default_max_wait_time = 15

Capybara.register_driver :firefox_headless do |app|
  options = ::Selenium::WebDriver::Firefox::Options.new
  options.args << '--headless'

  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.javascript_driver = :firefox_headless

RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.connection.execute("TRUNCATE listings, users, availabilities, requests;")
  end

  config.backtrace_exclusion_patterns = [/gem/]
end
