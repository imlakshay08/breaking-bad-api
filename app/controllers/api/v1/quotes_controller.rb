module Api
  module V1
    class QuotesController < ApplicationController
      before_action :set_quote, only: [:show]

      # GET /api/v1/quotes
      def index
        @quotes = Quote.all
        
        # Apply filters
        @quotes = @quotes.where(author: params[:author]) if params[:author].present?
        @quotes = @quotes.where(series: params[:series]) if params[:series].present?
        
        # Pagination
        @quotes = @quotes.page(params[:page]).per(params[:per_page] || 10)
        
        render json: @quotes
      end

      # GET /api/v1/quotes/:id
      def show
        render json: @quote
      end

      # GET /api/v1/quotes/random
      def random
        @quote = Quote.order("RANDOM()").first
        render json: @quote
      end

      private

      def set_quote
        @quote = Quote.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Quote not found' }, status: :not_found
      end
    end
  end
end
