module Api
  module V1
    class LocationsController < ApplicationController
      before_action :set_location, only: [:show]

      # GET /api/v1/locations
      def index
        @locations = Location.all
        
        # Apply filters
        @locations = @locations.where(city: params[:city]) if params[:city].present?
        @locations = @locations.where(state: params[:state]) if params[:state].present?
        
        # Pagination
        @locations = @locations.page(params[:page]).per(params[:per_page] || 10)
        
        render json: @locations
      end

      # GET /api/v1/locations/:id
      def show
        render json: @location
      end

      private

      def set_location
        @location = Location.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Location not found' }, status: :not_found
      end
    end
  end
end
