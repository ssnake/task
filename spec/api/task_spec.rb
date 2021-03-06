# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Task::API do
  include Rack::Test::Methods

  def app
    Task::API
  end

  describe '#ping' do
    context 'GET /api/v1/ping' do
      it 'returns pong' do
        get '/api/v1/ping'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq({ 'ping' => 'pong' })
      end
    end
  end

  context 'with full db' do
    let!(:bearer1) { create(:bearer) }
    let!(:bearer2) { create(:bearer) }
    let!(:stocks) { create_list(:stock, 5) }

    before do
      BearerStockAssociation.create bearer: bearer1, stock: stocks[0]
      BearerStockAssociation.create bearer: bearer1, stock: stocks[1]
      BearerStockAssociation.create bearer: bearer1, stock: stocks[2]
      BearerStockAssociation.create bearer: bearer2, stock: stocks[0]
    end

    describe '#stocks' do
      it 'returns a list of stocks' do
        get '/api/v1/stocks/index'
        expect(last_response.status).to eq(200)
        response = JSON.parse(last_response.body)
        expect(response).to include('data')
        expect(response['data'].first).to include('type')
        expect(response['data'].first['type']).to eq('stock')
      end
    end

    describe '#create' do
      let(:body) do
        { stock: { name: name, bearer_name: bearer_name } }
      end

      context 'with new stock and new bearer names' do
        let(:name) { 'new_stock' }
        let(:bearer_name) { 'new bearer' }

        it 'creates new stock and new bearer' do
          expect do
            post '/api/v1/stocks/create', body.to_json, 'CONTENT_TYPE' => 'application/json'
            expect(last_response.status).to eq(201)
          end.to(change { Stock.count }
            .and(change { Bearer.count })
            .and(change { BearerStockAssociation.count }))
        end
      end

      context 'with existed stock and bearer name' do
        let(:name) { stocks[1][:name] }
        let(:bearer_name) { bearer2[:name] }
        it "doesn't add new record to stock and bearer, but 1 to bearer stock association" do
          expect do
            post '/api/v1/stocks/create', body.to_json, 'CONTENT_TYPE' => 'application/json'
            expect(last_response.status).to eq(201)
          end.to(change { Stock.count }.by(0)
            .and(change { Bearer.count }.by(0))
            .and(change { BearerStockAssociation.count }))
        end

        context 'with existed association' do
          let(:name) { stocks[0][:name] }
          let(:bearer_name) { bearer1[:name] }

          it "doesn't add any new record" do
            expect do
              post '/api/v1/stocks/create', body.to_json, 'CONTENT_TYPE' => 'application/json'
              expect(last_response.status).to eq(201)
            end.to(change { Stock.count }.by(0)
              .and(change { Bearer.count }.by(0))
              .and(change { BearerStockAssociation.count }.by(0)))
          end
        end
      end
    end
    describe '#put' do
      let(:stock) { stocks.first }
      let(:name) { 'new stock name' }
      let(:body) do
        { name: name }
      end

      it 'changes name to new one' do
        expect do
          put "/api/v1/stocks/#{stock.id}", body.to_json, 'CONTENT_TYPE' => 'application/json'
        end.to(change { stock.reload.name })
        expect(last_response.status).to eq(200)
      end

      it 'uses wrong id' do
        put "/api/v1/stocks/#{stock.id + 1000}", body.to_json, 'CONTENT_TYPE' => 'application/json'
        expect(last_response.status).to eq(404)
      end
      context 'with already existed name' do
        let(:name) { stocks.last.name }
        it "won't update stock name to existed one" do
          put "/api/v1/stocks/#{stock.id}", body.to_json, 'CONTENT_TYPE' => 'application/json'
          expect(last_response.status).to eq(500)
        end
      end
    end
    describe '#delete' do
      let(:stock) { stocks.first }
      it 'deletes stock' do
        expect do
          delete "/api/v1/stocks/#{stock.id}"
        end.to(change { stock.reload.is_deleted })
      end
      it 'deletes stock and it dissapears from list' do
        get '/api/v1/stocks/index'
        response = JSON.parse(last_response.body)
        count = response['data'].count
        delete "/api/v1/stocks/#{stock.id}"
        get '/api/v1/stocks/index'
        response = JSON.parse(last_response.body)
        count2 = response['data'].count
        expect(count - 1).to eq(count2)
      end

      it 'tries to delete unexisting stock' do
        delete "/api/v1/stocks/#{stock.id + 1000}"
        expect(last_response.status).to eq(404)
      end
    end
  end
end
