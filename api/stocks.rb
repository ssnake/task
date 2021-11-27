require_relative "ping"

module Stocks
  class API < Grape::API
    include Grape::Extensions::Hashie::Mash::ParamBuilder
    version 'v1'
    prefix :api
    
    content_type :jsonapi, "application/vnd.api+json"
    content_type :json, 'application/json'
    
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi
    
    default_format :jsonapi
    
    params do
      optional :stock, type: Hash do
        optional :name, type: String
        optional :bearer_name, type: String
      end
    end

    namespace :stocks do

      get :index do
        stocks = Stock.all
        render stocks# include: [:bearer]
      end

      post :create do
        bearer = Bearer.find_or_create_by name: params.stock.bearer_name
        stock = Stock.find_or_create_by name: params.stock.name
        BearerStockAssociation.find_or_create_by bearer: bearer, stock: stock
        render stock, include: [:bearers]
        
      end
    end
  end
end