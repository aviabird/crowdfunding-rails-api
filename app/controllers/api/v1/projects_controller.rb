module Api
  module V1
    class ProjectsController < ApplicationController

      before_action :find_project, only: [:show, :update, :destroy, :show]
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def index
        @projects = Project.all
        render json: @projects, status: :ok
      end

      def create
        upload_response = upload_image(params[:image_data])
        @project = Project.new(project_params)
        @project.image_url = upload_response["secure_url"]
        if @project.save!
          render json: @project, status: :created
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @project, status: :ok
      end

      def update 
        if @project.update(project_params)
          render json: @project, status: :ok
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @project.destroy
          render json: { message: "project deleted" }, status: :ok
        else
          render json: { message: "error: #{@project.errors}" }, status: :internal_server_error
        end
      end

      private

      def project_params
        params.require(:project).permit(:id, :title, :video_url, :image_url, :goal_amount, :funding_model, :start_date, :duration, :category_id,
          rewards_attributes: [:id, :title, :description, :image_url, :amount],
          story_attributes: [:id, :heading, :description],
          faqs_attributes: [:id, :question, :answer],
          links_attributes: [:id, :url],
          events_attributes: [:id, :title, :country, :date, :image_url, :description]  
        )
      end

      def find_project
        @project = Project.find_by!(id: params[:id])
      end

      def upload_image(image_data)
        Cloudinary::Uploader.upload(image_data, options = {})
      end
    end
  end
end
