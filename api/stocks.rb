require_relative "ping"

module Stocks
  class API < Grape::API
    version 'v1'
    prefix :api
    content_type :jsonapi, "application/vnd.api+json"
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi
    default_format :jsonapi

    
    namespace :stocks do
      
      get :index do
        stocks = Stock.all
        render stocks# include: [:bearer]
      end

      post :create do

      end
    end
  end
end