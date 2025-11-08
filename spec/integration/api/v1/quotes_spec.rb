require 'rails_helper'

RSpec.describe 'api/v1/quotes', type: :request do
  path '/api/v1/quotes' do
    get 'Lists all quotes' do
      tags 'Quotes'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, required: false, description: 'Page number'
      parameter name: :per_page, in: :query, type: :integer, required: false, description: 'Items per page'
      parameter name: :author, in: :query, type: :string, required: false, description: 'Filter by author'

      response '200', 'quotes found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              quote: { type: :string },
              author: { type: :string },
              series: { type: :string }
            }
          }

        let!(:quotes) { create_list(:quote, 3) }
        run_test!
      end
    end
  end

  path '/api/v1/quotes/random' do
    get 'Retrieves a random quote' do
      tags 'Quotes'
      produces 'application/json'

      response '200', 'random quote found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            quote: { type: :string },
            author: { type: :string },
            series: { type: :string }
          }

        let!(:quotes) { create_list(:quote, 3) }
        run_test!
      end
    end
  end

  path '/api/v1/quotes/{id}' do
    get 'Retrieves a quote' do
      tags 'Quotes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'quote found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            quote: { type: :string },
            author: { type: :string },
            series: { type: :string }
          }

        let(:id) { create(:quote).id }
        run_test!
      end

      response '404', 'quote not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
