# frozen_string_literal: true

require_relative 'ping'

module Stocks
  # set of endpoints responsibled for stocks
  class API < Grape::API
    include Grape::Extensions::Hashie::Mash::ParamBuilder
    version 'v1'
    prefix :api

    content_type :jsonapi, 'application/vnd.api+json'
    content_type :json, 'application/json'

    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi

    default_format :jsonapi

    namespace :stocks do
      get :index do
        stocks = Stock.all
        render stocks, include: [:bearers]
      end

      params do
        optional :stock, type: Hash, documentation: { param_type: 'body' } do
          optional :name, type: String
          optional :bearer_name, type: String
        end
      end

      format :json
      desc 'creates new stock and new bearer'
      post :create do
        bearer = Bearer.find_or_create_by name: declared(params).stock.bearer_name
        stock = Stock.find_or_create_by name: declared(params).stock.name
        BearerStockAssociation.find_or_create_by bearer: bearer, stock: stock
        render stock, include: [:bearers]
      end


      desc 'Update a stock.'
      params do
        requires :id, type: String, desc: 'Stock ID.' 
        requires :name, type: String, desc: 'Stock name', documentation: { param_type: 'body' }
      end

      put ':id' do
        if stock = Stock.find_by(id: declared(params).id)
          stock.update!(declared(params))
        else
          status 404
        end
      end
    end
  end
end
