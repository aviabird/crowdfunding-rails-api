class Api::V1::UsersController < ApplicationController
  
  skip_before_action :authenticate_request, only: [:create, :confirm_email, :show]
  before_action :find_user, only: [:update, :show]

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver
      render json: { message: "A Confirmation email has bent sent to #{user.email}, please confirm it " }
    else
      render json: { error: user.errors }
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      message = "Welcome to the CrowdPouch! Your email has been confirmed. Please sign in to continue"
    else
      message = "Email is already confirmed or the user does not exist"
    end

    redirect_url = Rails.configuration.email_confirmation['redirect_url']
    redirect_to "#{redirect_url}?message=#{message}"
  end

  def show
    render json: @user, status: :ok
  end

  def update_profile_pic
    user = current_user
    command = ImageUpload.call(params[:image_data])
    if command.success?
      user.image_url = command.result
      if user.save!
        render json: user, status: :ok
      else
        render json: { errors: user.errors }, status: 422
      end
    else
      render json: { errors: command.errors }
    end
  end

  def update_user_address

  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_url,
      address_attributes: [:street_address, :city, :postcode, :country]
    )
  end


  def find_user
    @user = User.find(params[:id])
  end

end
