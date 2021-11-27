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

  context "with full db" do
    let!(:bearer1) { create(:bearer)}
    let!(:bearer2) { create(:bearer)}
    let!(:stocks) {create_list(:stock, 5)}

    before do
      BearerStockAssociation.create bearer: bearer1, stock: stocks[0]
      BearerStockAssociation.create bearer: bearer1, stock: stocks[1]
      BearerStockAssociation.create bearer: bearer1, stock: stocks[2]
      BearerStockAssociation.create bearer: bearer2, stock: stocks[0]
    end

    describe "#stocks" do
    
      it "returns a list of stocks" do
        get '/api/v1/stocks/index'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq({})
      end 
    end
  end

end