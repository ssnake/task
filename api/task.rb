module Task
  class API < Grape::API
    version 'v1'
    format :json
    prefix :api

    get '/ping' do
      { ping: 'pong' }
    end
  end
end