# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :create

  # Post /auth/login
  def create
    @user = User.find_by(email: params[:email])
    puts @user
    puts params[:password]
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.zone.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     email: @user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
