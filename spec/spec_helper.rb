# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/vendor/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Views', 'app/views'
end
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# OmniAuth.config.test_mode = true

# def add_user_mock
#   OmniAuth.config.add_mock :twitter,
#                            uid: "twitter-12345",
#                            info: { nickname: "Nedliest Catch",
#                                    image: "imageofned.html" },
#                            credentials: { token: "1234549039jrf0a",
#                                           secret: "aoiefnaewofianefo" }
# end

def sign_in_user
  visit root_url
      click_link "Sign In"

      fill_in 'email', with: "ned@gmail.com"
      fill_in 'password', with: "password"
      click_button 'Sign In'
end

RSpec.configure do |config|
  config.include Capybara::DSL

  config.mock_with :rspec

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
