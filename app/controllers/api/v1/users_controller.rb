class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: { data: "A Confirmation email has bent sent to #{user.email}, please confirm it " }
    else
      render json: { error: user.errors }
    end
  end
  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
