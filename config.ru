require 'grape'

require_relative "config/environment"
require_relative "api/task"


use OTR::ActiveRecord::ConnectionManagement
# Enable ActiveRecord's QueryCache for every request (optional)
use OTR::ActiveRecord::QueryCache

run Task::API