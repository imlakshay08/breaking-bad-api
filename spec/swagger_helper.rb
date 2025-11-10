require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Breaking Bad API V1',
        version: 'v1',
        description: 'A RESTful API for Breaking Bad TV series data including characters, episodes, quotes, deaths, and locations.'
      },
      paths: {},
      servers: [
        {
          url: 'http://localhost:3000',
          description: 'Development server'
        },
        {
          url: 'https://{defaultHost}',
          description: 'Production server',
          variables: {
            defaultHost: {
              default: 'api.breakingbadapi.com'
            }
          }
        }
      ],
      components: {
        schemas: {
          character: {
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
            },
            required: ['id', 'name']
          },
          quote: {
            type: :object,
            properties: {
              id: { type: :integer },
              quote: { type: :string },
              author: { type: :string },
              series: { type: :string }
            },
            required: ['id', 'quote', 'author']
          },
          episode: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              season: { type: :integer },
              episode: { type: :integer },
              air_date: { type: :string, format: :date },
              characters: { type: :array, items: { type: :string } },
              series: { type: :string }
            },
            required: ['id', 'title', 'season', 'episode']
          },
          death: {
            type: :object,
            properties: {
              id: { type: :integer },
              death: { type: :string },
              cause: { type: :string },
              responsible: { type: :string },
              last_words: { type: :string },
              season: { type: :integer },
              episode: { type: :integer },
              number_of_deaths: { type: :integer }
            },
            required: ['id', 'death', 'cause']
          },
          location: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              lat: { type: :number },
              lng: { type: :number },
              address: { type: :string },
              city: { type: :string },
              state: { type: :string },
              zip: { type: :string }
            },
            required: ['id', 'name']
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
