# frozen_string_literal: true

source 'https://rubygems.org'

gem 'grape'
gem 'grape-jsonapi', require: 'grape_jsonapi'
gem 'grape-swagger'
gem 'otr-activerecord'
gem 'rack-contrib'
gem 'rake'
gem 'sqlite3'

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
end
group :development, :test do
  gem 'byebug'
  gem 'rubocop', '~> 1.23', require: false
end
