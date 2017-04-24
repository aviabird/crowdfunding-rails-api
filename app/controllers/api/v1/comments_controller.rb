module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :authenticate_request, only: :index
      before_action :find_project, only: :index
      before_action :find_comment, only: [:update, :destroy]

      def index
        comments = @project.comments.all
        render json: comments, status: :ok 
      end

      def create
        user_id = @current_user.id
        comment = Comment.new(comment_params)
        comment.user_id = user_id

        if comment.save
          render json: comment, status: :ok
        else
          render json: { errors: comment.errors }
        end
      end

      def destroy
        comment = @comment.destroy
        if comment
          render json: { id: comment.id }, status: :ok
        else
          render json: { errors: command.errors }
        end
      end

      private

      def find_project
        @project = Project.find(params[:project_id])
      end

      def find_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.permit(:body, :project_id)
      end

    end
  end
end

