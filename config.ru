ENV['RACK_ENV'] ||= 'development'

require 'grape'
require_relative "config/environment"
use OTR::ActiveRecord::ConnectionManagement
# Enable ActiveRecord's QueryCache for every request (optional)
use OTR::ActiveRecord::QueryCache

run Task::API
