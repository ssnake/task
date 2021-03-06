# frozen_string_literal: true

require 'grape-swagger'
require_relative 'ping'
require_relative 'stocks'

module Task
  # main grape task which mounts all api endpoints
  class API < Grape::API
    version 'v1'
    prefix :api
    content_type :jsonapi, 'application/vnd.api+json'
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi
    default_format :jsonapi

    rescue_from :all do |e|
      error!({ data: { error: e.message } }, 500, { 'Content-Type' => 'application/vnd.api+json' })
    end

    ENV['RACK_ENV'] != 'test' && http_basic do |username, password|
      Rack::Utils.secure_compare(username, 'test') && 
      Rack::Utils.secure_compare(password, 'test')
    end
    

    mount ::Ping::API
    mount ::Stocks::API

    add_swagger_documentation hide_documentation_path: true,
                              api_version: 'v1',
                              info: {
                                title: 'Task Application',
                                description: 'This app is implemented features provided in task desc'
                              }
  end
end
