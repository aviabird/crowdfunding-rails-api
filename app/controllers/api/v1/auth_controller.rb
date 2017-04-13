module Api
  module V1
    class AuthController < ApplicationController
      include CommonConcern

      def authenticate
        @oauth = "Oauth::#{params['provider'].titleize}".constantize.new(params)  
        if @oauth.authorized?
          @user = User.from_auth(@oauth.formatted_user_data, current_user)
          if @user
            generate_token_for_social_user
            # render_success(token: Token.encode(@user.id), user: @user)
            # sign_in(@user)
            render_create_success
          else
            render_error "This #{params[:provider]} account is used already"
          end
        else
          render_error("There was an error with #{params['provider']}. please try again.")
        end
      end

      private 

      # Devise Logic Replication for Server Token Creation 
      def generate_token_for_social_user
        # email auth has been bypassed, authenticate user
        @client_id = SecureRandom.urlsafe_base64(nil, false)
        @token     = SecureRandom.urlsafe_base64(nil, false)

        @user.tokens[@client_id] = {
          token: BCrypt::Password.create(@token),
          expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
        }
        @user.save!

        update_auth_header
      end

      def update_auth_header
        # cannot save object if model has invalid params
        return unless @user and @user.valid? and @client_id

        # Generate new client_id with existing authentication
        # @client_id = nil unless @used_auth_by_token

        # should not append auth header if @resource related token was
        # cleared by sign out in the meantime
        return if @user.reload.tokens[@client_id].nil?

        auth_header = @user.build_auth_header(@token, @client_id)
        # update the response header
        response.headers.merge!(auth_header)  
      end

      def render_create_success
        render json: {
          status: 'success',
          data:   @user.as_json,
          headers: response.headers
        }
      end
    end
  end
end

