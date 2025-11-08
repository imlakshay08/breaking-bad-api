module Api
  module V1
    class DeathsController < ApplicationController
      before_action :set_death, only: [:show]

      # GET /api/v1/deaths
      def index
        @deaths = Death.all
        
        # Apply filters
        @deaths = @deaths.where(season: params[:season]) if params[:season].present?
        @deaths = @deaths.where(responsible: params[:responsible]) if params[:responsible].present?
        
        # Pagination
        @deaths = @deaths.page(params[:page]).per(params[:per_page] || 10)
        
        render json: @deaths
      end

      # GET /api/v1/deaths/:id
      def show
        render json: @death
      end

      private

      def set_death
        @death = Death.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Death not found' }, status: :not_found
      end
    end
  end
end
