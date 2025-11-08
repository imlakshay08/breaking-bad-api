module Api
  module V1
    class CharactersController < ApplicationController
      before_action :set_character, only: [:show]

      # GET /api/v1/characters
      def index
        @characters = Character.all
        
        # Apply filters
        @characters = @characters.where(name: params[:name]) if params[:name].present?
        @characters = @characters.where(category: params[:category]) if params[:category].present?
        @characters = @characters.where(status: params[:status]) if params[:status].present?
        
        # Pagination
        @characters = @characters.page(params[:page]).per(params[:per_page] || 10)
        
        render json: @characters
      end

      # GET /api/v1/characters/:id
      def show
        render json: @character
      end

      private

      def set_character
        @character = Character.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Character not found' }, status: :not_found
      end
    end
  end
end
