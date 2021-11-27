require_relative "ping"
require_relative "stocks"

module Task
  class API < Grape::API
    version 'v1'
    prefix :api
    content_type :jsonapi, "application/vnd.api+json"
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi
    default_format :jsonapi

    mount ::Ping::API
    mount ::Stocks::API
  end
end