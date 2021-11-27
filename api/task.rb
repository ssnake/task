module Task
  class API < Grape::API
    version 'v1'
    prefix :api
    content_type :jsonapi, "application/vnd.api+json"
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi
    default_format :jsonapi
    get '/ping' do
      { ping: 'pong' }
    end

    get '/stocks' do
      stocks = Stock.all
      render stocks, include: [:bearer]
    end
  end
end