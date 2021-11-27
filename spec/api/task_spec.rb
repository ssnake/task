require "spec_helper"

RSpec.describe Task::API do
  include Rack::Test::Methods
  
  def app
    Task::API
  end
  describe "#ping" do
    context 'GET /api/v1/ping' do
      it 'returns pong' do
        get '/api/v1/ping'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq({"ping"=>"pong"})
      end
    end
  end
  describe "#stocks" do
    context "with full db" do
      let!(:bearers) { create_list(:bearer, 5)}
      it "returns a list of stocks" do
        get '/api/v1/stocks'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq({"ping"=>"pong"})
      end 
    end
  end

end