# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    User.create!(create_params)
    render json: { message: 'User created' }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    render json: User.all
  end

  private

  def create_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
