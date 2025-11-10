module Api
  module V1
    class EpisodesController < ApplicationController
      before_action :set_episode, only: [:show]

      # GET /api/v1/episodes
      def index
        @episodes = Episode.ordered
        
        # Apply filters
        @episodes = @episodes.where(season: params[:season]) if params[:season].present?
        @episodes = @episodes.where(series: params[:series]) if params[:series].present?
        
        # Pagination
        @episodes = @episodes.page(params[:page]).per(params[:per_page] || 10)
        
        render json: @episodes
      end

      # GET /api/v1/episodes/:id
      def show
        render json: @episode
      end

      # GET /api/v1/episodes/random
      def random
        @episode = Episode.order("RANDOM()").first
        render json: @episode
      end

      private

      def set_episode
        @episode = Episode.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Episode not found' }, status: :not_found
      end
    end
  end
end
