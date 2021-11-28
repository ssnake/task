# frozen_string_literal: true

module Ping
  # this is test api which has only one method ping
  class API < Grape::API
    version 'v1'
    prefix :api
    content_type :json, 'application/json'
    default_format :json

    get '/ping' do
      { ping: 'pong' }
    end
  end
end
