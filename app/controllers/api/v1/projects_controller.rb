module Api
  module V1
    class ProjectsController < ApplicationController

      before_action :authenticate_request, only: [:create, :get_draft_project, :fund_project, :launch]
      before_action :find_project, only: [:show, :update, :launch, :destroy, :show, :fund_project]
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def index
        @projects = Project.all.where(aasm_state: "funding")
        render json: @projects, status: :ok
      end

      def search_by_category
        category = Category.find_by_name(params[:category])
        @projects = Project.where(category: category, aasm_state: "funding")
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

      def fund_project
        token = params[:stripeToken]
        amount = params[:amount]
        funding_type = @project.funding_model

        command = if(funding_type == "flexi")
          CreateCharge.call(token, amount, @current_user, @project) 
        else
          CreateFutureDonor.call(token, amount, @current_user, @project)
        end
        
        if command.success?
          message = funding_type == "flexi" ? "You have successfully backed this project"
            : "Thanks for backing this project, We will charge once this project is fully funded"
          render json: { message: message }
        else
          render json: { error: command.errors }
        end
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
