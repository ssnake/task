# frozen_string_literal: true

require 'otr-activerecord'
require 'database_cleaner/active_record'

$LOAD_PATH.unshift(
  File.expand_path('..', __dir__),
  File.expand_path('../config', __dir__),
  File.expand_path('../api', __dir__)
)
ENV['RACK_ENV'] ||= 'test'
require 'environment'

DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
