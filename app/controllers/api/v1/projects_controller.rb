module Api
  module  V1
    class ProjectsController < ApplicationController
      def index
        projects = Project.all
        render json: projects
      end

      def create
        project = Project.new(project_params)
        if project.save
          render json: project, status: :created
        else
          render json: project.errors, status: :unprocessable_entity
        end
      end


      private

      def project_params
        params.require(:project).permit(:id, :title, :image_url, :video_url, :goal, :model, :start_date, :duration,
          rewards_attributes: [:id, :title, :description, :image_url, :amount],
          story_attributes: [:id, :heading, :description],
          faqs_attributes: [:id, :question, :answer],
          links_attributes: [:id, :url],
          events_attributes: [:id, :title, :country, :date, :image_url, :description]  
        )
      end
    end
  end
end
