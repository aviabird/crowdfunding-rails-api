class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password])

      if command.success?
        result = command.result
        headers.merge(Authorization: result[:auth_token])
        render json: { data:  result[:user] }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

end
