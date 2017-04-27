module Api
  module V1
    class AuthController < ApplicationController

      skip_before_action :authenticate_request

      def authenticate
        @oauth = "Oauth::#{params['provider'].titleize}".constantize.new(params)  
        if @oauth.authorized?
          @user = User.from_auth(@oauth.formatted_user_data, current_user)
          if @user
            render_success
          else
            render json: { error: "This #{params[:provider]} account is used already" }
          end
        else
          render json: { error: "There was an error with #{params['provider']}. please try again." }
        end
      end

      private 

      def render_success
        token = JsonWebToken.encode(user_id: @user.id)
        response.set_header("Authorization", token)
        render json: @user, serializer: AuthUserSerializer, status: :ok
      end

    end
  end
end

