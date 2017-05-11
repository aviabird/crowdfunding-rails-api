module Api
  module V1
    class ProjectsController < ApplicationController

      before_action :authenticate_request, only: [:create, :update, :get_draft_project, :fund_project, :launch, :report_project]
      before_action :find_project, only: [:show, :launch, :destroy, :show, :fund_project, :report_project]

      def index
        @projects = Project.all.where(aasm_state: "funding")
        render json: @projects, each_serializer: LiteProjectSerializer, status: :ok
      end

      def search_by_category
        category = Category.find_by_name(params[:category])
        @projects = Project.where(category: category, aasm_state: "funding")
        render json: @projects, each_serializer: LiteProjectSerializer , status: :ok
      end

      def create
        result = ProjectService::CreateProject.call(params)
        project = result[:model]
        if result[:status]
          render json: project, status: :created
        else
          render json: project.errors, status: :unprocessable_entity
        end
      end

      def update 
        result = ProjectService::UpdateProject.call(params)
        project = result[:model]
        if result[:status]
          render json: project, status: :created
        else
          render json: project.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @project, status: :ok
      end

      def view_project_from_mail
        id = params[:id]
        redirect_url = Rails.configuration.email_confirmation['redirect_url']
        redirect_to "#{redirect_url}/projects/#{id}"           
      end

      def launch
        status = @project.launch_project
        if status
          @project.save
          current_user.notifications.create(
            subject: 'Project Launch',
            description: 'Your project was successfully launched, we will notify you once the project is approved by the admin'
          )
        end
        render json: { status: status }
      end

      def get_draft_project
        project = current_user.draft_project
        if(!project)
          project = Project.draft(current_user)
        end
        render json: project, status: :ok
      end

      def destroy
        if @project.destroy
          render json: { message: "project deleted" }, status: :ok
        else
          render json: { message: "error: #{@project.errors}" }, status: :internal_server_error
        end
      end

      def report_project
        reason = params[:reason]
        report = Report.new(
          reason: reason,
          user_id: current_user.id,
          project_id: @project.id
        )
        if report.save
          render json: { message: "This project has been reported, we will notify you once we look into the matter" }
        else
          render json: { message: "error: #{report.errors}" }, status: 422
        end
      end

      private

      def find_project
        @project = Project.find(params[:id])
      end

      def update_params
        params.permit(
          :video_url, :image_url, :category_id,
          rewards_attributes: [:id, :title, :description, :image_url, :amount],
          story_attributes: [:id, sections_attributes: [:id, :heading, :description] ],
          faqs_attributes: [:id, :question, :answer],
          links_attributes: [:id, :url],
          events_attributes: [:id, :title, :country, :date, :image_url, :description]
        )
      end

    end
  end
end
