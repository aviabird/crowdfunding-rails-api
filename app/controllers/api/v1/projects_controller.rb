module Api
  module V1
    class ProjectsController < ApplicationController

      before_action :authenticate_request, only: [:create, :get_draft_project]
      before_action :find_project, only: [:show, :update, :launch, :destroy, :show]
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def index
        @projects = Project.all
        render json: @projects, status: :ok
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

      def show
        render json: @project, status: :ok
      end

      def launch
        status = @project.launch_project
        @project.save if status
        render json: { status: status }
      end

      def get_draft_project
        project = current_user.draft_project
        if(!project)
          project = Project.draft(current_user)
        end
        render json: project, status: :ok
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

      def find_project
        @project = Project.find(params[:id])
      end

    end
  end
end
