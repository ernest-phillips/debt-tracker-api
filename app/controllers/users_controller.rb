# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    User.create!(create_params)
    render json: { message: 'User created' }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # GET /users/{username}
  def show
    if current_user.id != params[:id].to_i
      render json: { error: 'Forbidden' }, status: :forbidden
    else
      render json: current_user, status: :ok
    end
  end

  def update
    if current_user.id != params[:id].to_i
      render json: { error: 'Forbidden' }, status: :forbidden
    else
      current_user.update!(update_params)
      render json: { message: 'User updated' }, status: :ok
    end
  end

  def destroy
    if current_user.id != params[:id].to_i
      render json: { error: 'Forbidden' }, status: :forbidden
    else
      current_user.update(deleted_at: DateTime.now)
      render json: { message: 'User deleted' }, status: :ok
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

  def update_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
