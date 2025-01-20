# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  # Include Devise test helpers
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :controller
  
  # Ensure transactional fixtures are used
  config.use_transactional_fixtures = true

  # Configure fixture path
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # Filter Rails backtrace
  config.filter_rails_from_backtrace!

  # Optional: Add a hook to print out additional information on test failure
  config.after(:each) do |example|
    if example.exception
      puts "Test failed: #{example.description}"
      puts "Exception: #{example.exception}"
    end
  end
end

# Ensure database is clean before tests
begin
  require 'database_cleaner'
  DatabaseCleaner.strategy = :transaction
rescue LoadError
  # Skip if database_cleaner is not installed
end
