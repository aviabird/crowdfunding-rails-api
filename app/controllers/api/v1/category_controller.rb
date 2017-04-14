module Api
  module V1
    class CategoryController < ApplicationController
      skip_before_action :authenticate_request

      def index
        @categories = Category.all
        render json: @categories, status: :ok
      end
    end
  end
end

