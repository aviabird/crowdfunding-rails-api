module Api
  module  V1
    class ProjectsController < ApplicationController
      before_action :sanitise_params, only: :create
      def index
      end

      def create
      end
    end
  end
end


