# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :create

  # Post /auth/login
  def create
    @user = User.find_by(email: authentication_params[:email])
    if @user&.authenticate(authentication_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)

      render json: { **token, email: @user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def authentication_params
    params.require(:authentication).permit(:email, :password)
  end
end
