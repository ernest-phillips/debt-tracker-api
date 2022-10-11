# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show update]
  skip_before_action :authorize_request, only: :create

  attr_reader :user

  def create
    User.create!(create_params)
    render json: { message: 'User created' }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # GET /users/{username}
  def show
    if current_user != user
      render json: { error: 'Forbidden' }, status: :forbidden
    else
      render json: user, status: :ok
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(update_params)
    render json: { message: 'User updated' }, status: :ok
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def create_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

  def update_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
