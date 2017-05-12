module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :authenticate_request, only: :index
      before_action :find_project, only: :index
      before_action :find_comment, only: [:update, :destroy]

      def index
        render_nested_comments(@project)
      end

      def create
        project = Project.find(params[:project_id])
        if params[:parent_id].to_i > 0
          parent = Comment.find_by_id(params.delete(:parent_id))
          comment = parent.children.build(comment_params)
        else
          comment = Comment.new(comment_params)
        end
        comment.user_id = @current_user.id

        if comment.save
          render_nested_comments(project)
        else
          render json: { errors: comment.errors }
        end
      end

      def update
        project = @comment.project
        if @comment.update(comment_params)
          render_nested_comments(project)
        else
          render json: { errors: @comment.errors }
        end
      end


      def destroy
        project = @comment.project
        comment = @comment.destroy
        if comment
          render_nested_comments(project)
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
        params.permit(:body, :project_id, :author_name, :author_image)
      end

      def build_nested_comments_structure(comments_hash)
        comments_hash.map do |parent_id, comments| 
          if parent_id == ""
            comments.each do |comment|
              comment_id = comment["id"].to_s
              comment["child_comments"] = comments_hash[comment_id]
              comments_hash.delete(comment_id)
            end
          end
        end
        comments_hash[""]
      end

      def render_nested_comments(project)
        comments = project.comments.group_by(&:parent_id).as_json
        nested_comments = build_nested_comments_structure(comments)
        render json: nested_comments, status: :ok
      end

    end
  end
end

