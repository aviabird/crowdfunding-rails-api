module Api
  module V1
    class CategoryController < ApplicationController
      def index
        @categories = Category.all
        render json: @categories, status: :ok
      end
    end
  end
end

