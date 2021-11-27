require 'json'
require 'bundler'


Bundler.require(:default, ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)


require_relative "active_record"

['../models/*.rb', '../api/*.rb', '../api/serializers/*.rb'].each do |path|
  Dir[File.expand_path(path, __dir__)].each do |f|
    require f
  end
end


