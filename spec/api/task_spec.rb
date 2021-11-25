require "spec_helper"

RSpec.describe Task::API do
  include Rack::Test::Methods
  
  def app
    Task::API
  end

  context 'GET /api/v1/ping' do
    it 'returns an empty array of statuses' do
      get '/api/v1/ping'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({"ping"=>"pong"})
    end
  end
end