module Api
  module  V1
    class ProjectsController < ApplicationController
      before_action :sanitise_params, only: :create
      
      def index
      end

      def create
        project = Project.new(project_params)
        binding.pry
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

      def sanitise_params
        params['project']['rewards_attributes'] = params['project']['rewards']
        params['project']['story_attributes'] = params['project']['story']
        params['project']['faqs_attributes'] = params['project']['faqs']
        params['project']['links_attributes'] = params['project']['links']
        params['project']['events_attributes'] = params['project']['events']
      end

    end
  end
end
