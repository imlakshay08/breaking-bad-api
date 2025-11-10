Rails.application.routes.draw do
  # Mount Swagger UI
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check

  # API v1 routes
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :show]
      resources :episodes, only: [:index, :show] do
        collection do
          get :random
        end
      end
      resources :quotes, only: [:index, :show] do
        collection do
          get :random
        end
      end
      resources :deaths, only: [:index, :show]
      resources :locations, only: [:index, :show]
    end
  end
end
