require 'rails_helper'

RSpec.describe "Api::V1::Characters", type: :request do
  describe "GET /api/v1/characters" do
    let!(:characters) { create_list(:character, 3) }

    it "returns all characters" do
      get "/api/v1/characters"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end

    it "filters by name" do
      character = characters.first
      get "/api/v1/characters", params: { name: character.name }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(1)
      expect(json.first['name']).to eq(character.name)
    end

    it "filters by status" do
      alive_character = create(:character, status: 'Alive')
      get "/api/v1/characters", params: { status: 'Alive' }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.map { |c| c['id'] }).to include(alive_character.id)
    end

    it "supports pagination" do
      get "/api/v1/characters", params: { page: 1, per_page: 2 }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end
  end

  describe "GET /api/v1/characters/:id" do
    let(:character) { create(:character) }

    it "returns a specific character" do
      get "/api/v1/characters/#{character.id}"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(character.id)
      expect(json['name']).to eq(character.name)
    end

    it "returns 404 for non-existent character" do
      get "/api/v1/characters/99999"
      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json['error']).to eq('Character not found')
    end
  end
end
