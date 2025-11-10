require 'rails_helper'

RSpec.describe "Api::V1::Quotes", type: :request do
  describe "GET /api/v1/quotes" do
    let!(:quotes) { create_list(:quote, 3) }

    it "returns all quotes" do
      get "/api/v1/quotes"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end

    it "filters by author" do
      walter_quote = create(:quote, author: 'Walter White')
      get "/api/v1/quotes", params: { author: 'Walter White' }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.map { |q| q['id'] }).to include(walter_quote.id)
    end

    it "supports pagination" do
      get "/api/v1/quotes", params: { page: 1, per_page: 2 }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end
  end

  describe "GET /api/v1/quotes/:id" do
    let(:quote) { create(:quote) }

    it "returns a specific quote" do
      get "/api/v1/quotes/#{quote.id}"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(quote.id)
      expect(json['quote']).to eq(quote.quote)
    end

    it "returns 404 for non-existent quote" do
      get "/api/v1/quotes/99999"
      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json['error']).to eq('Quote not found')
    end
  end

  describe "GET /api/v1/quotes/random" do
    let!(:quotes) { create_list(:quote, 3) }

    it "returns a random quote" do
      get "/api/v1/quotes/random"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json).to have_key('id')
      expect(json).to have_key('quote')
      expect(json).to have_key('author')
    end
  end
end
