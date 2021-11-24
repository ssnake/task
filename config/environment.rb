require 'json'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)
require_relative "active_record"

