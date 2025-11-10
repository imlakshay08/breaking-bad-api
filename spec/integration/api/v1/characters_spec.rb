require 'swagger_helper'

RSpec.describe 'api/v1/characters', type: :request do
  path '/api/v1/characters' do
    get 'Lists all characters' do
      tags 'Characters'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, required: false, description: 'Page number'
      parameter name: :per_page, in: :query, type: :integer, required: false, description: 'Items per page'
      parameter name: :name, in: :query, type: :string, required: false, description: 'Filter by name'
      parameter name: :status, in: :query, type: :string, required: false, description: 'Filter by status'
      parameter name: :category, in: :query, type: :string, required: false, description: 'Filter by category'

      response '200', 'characters found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              birthday: { type: :string, format: :date },
              occupation: { type: :array, items: { type: :string } },
              img: { type: :string },
              status: { type: :string },
              nickname: { type: :string },
              appearance: { type: :array, items: { type: :integer } },
              portrayed: { type: :string },
              category: { type: :string }
            }
          }

        let!(:characters) { create_list(:character, 3) }
        run_test!
      end
    end
  end

  path '/api/v1/characters/{id}' do
    get 'Retrieves a character' do
      tags 'Characters'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'character found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            birthday: { type: :string, format: :date },
            occupation: { type: :array, items: { type: :string } },
            img: { type: :string },
            status: { type: :string },
            nickname: { type: :string },
            appearance: { type: :array, items: { type: :integer } },
            portrayed: { type: :string },
            category: { type: :string }
          }

        let(:id) { create(:character).id }
        run_test!
      end

      response '404', 'character not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
