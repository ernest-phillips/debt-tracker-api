class UsersController < ApplicationController
  def create
    user = User.create!(create_params)
    render json: { message: 'User created' }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def create_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
