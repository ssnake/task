require 'grape'
require 'active_record'
require_relative "api/task"

Dir[File.expand_path('config/*.rb', __dir__)].each do |f|
  require f
end

run Task::API