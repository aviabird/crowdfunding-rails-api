class Api::V1::AuthenticationController < ApplicationController

    skip_before_action :authenticate_request, only: :authenticate

    def authenticate
      email = params[:credentials][:email]
      password = params[:credentials][:password]
      command = AuthenticateUser.call(email, password)

      if command.success?
        result = command.result
        response.set_header("Authorization", result[:auth_token])
        render json: result[:user], serializer: UserSerializer, status: :ok
      else
        render json: { error: command.errors }
      end
    end

    def set_user_by_token
      render json: current_user, serializer: UserSerializer, status: :ok
    end

end
