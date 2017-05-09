class Api::V1::UsersController < ApplicationController
  
  skip_before_action :authenticate_request, only: [:create, :confirm_email, :show]
  before_action :find_user, only: [:update, :show]

  def create
    user = User.new(auth_params)
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

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def get_user_kyc_info
    kyc = current_user.kyc
    render json: kyc, status: :ok
  end

  def update_user_kyc_info
    kyc = Kyc.find_or_initialize_by(id: params[:id])
    kyc.attributes = kyc_permitted_params
    if (params[:document_image_data])
      command = ImageUpload.call(params[:document_image_data])
      if command.success?
        kyc.document_image_url = command.result
      end
    end
    kyc.user_id = current_user.id
    if kyc.save!
      render json: { message: 'user kyc saved' }, status: :ok
    else
      render json: { errors: kyc.errors }, status: 422
    end
  end

  private

  def auth_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :secondary_email, :phone_no, :password, :image_url,
      :facebook_url, :twitter_url, :instagram_url, :google_plus_url,
      address_attributes: [:id, :street_address, :city, :postcode, :country],
    )
  end

  def find_user
    @user = User.find(params[:id])
  end

  def kyc_permitted_params
    params.permit(:document_id, :document_type, :name, :nationality, :birth_date)
  end

end
