module Ping
  class API < Grape::API
    version 'v1'
    prefix :api
    
    default_format :jsonapi
    get '/ping' do
      { ping: 'pong' }
    end

  end
end