require 'simplecov'
SimpleCov.start do
  add_filter 'spec/dummy'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'
  add_group 'Libraries', 'lib'
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'ffaker'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'

require 'cancan/matchers'

require 'solidus_trackers/factories'
FactoryBot.find_definitions

RSpec.configure do |config|
  config.fail_fast = false
  config.run_all_when_everything_filtered = true
  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!

  config.include FactoryBot::Syntax::Methods
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller

  Capybara.register_driver(:poltergeist) do |app|
    Capybara::Poltergeist::Driver.new app, timeout: 90
  end
  Capybara.javascript_driver = :poltergeist
  Capybara.default_max_wait_time = 10

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
