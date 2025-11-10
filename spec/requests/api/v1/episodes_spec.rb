require 'rails_helper'

RSpec.describe "Api::V1::Episodes", type: :request do
  describe "GET /api/v1/episodes" do
    let!(:episodes) { create_list(:episode, 3) }

    it "returns all episodes" do
      get "/api/v1/episodes"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end

    it "filters by season" do
      season_episode = create(:episode, season: 5)
      get "/api/v1/episodes", params: { season: 5 }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.map { |e| e['id'] }).to include(season_episode.id)
    end

    it "supports pagination" do
      get "/api/v1/episodes", params: { page: 1, per_page: 2 }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end
  end

  describe "GET /api/v1/episodes/:id" do
    let(:episode) { create(:episode) }

    it "returns a specific episode" do
      get "/api/v1/episodes/#{episode.id}"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(episode.id)
      expect(json['title']).to eq(episode.title)
    end

    it "returns 404 for non-existent episode" do
      get "/api/v1/episodes/99999"
      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json['error']).to eq('Episode not found')
    end
  end

  describe "GET /api/v1/episodes/random" do
    let!(:episodes) { create_list(:episode, 3) }

    it "returns a random episode" do
      get "/api/v1/episodes/random"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json).to have_key('id')
      expect(json).to have_key('title')
    end
  end
end
