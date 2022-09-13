class CreditorsController < ApplicationController

  def create
    Creditor.create!(create_params)
    render json: { message: 'Creditor created' }, status: :created
  end

  private

  def create_params
    params.require(:creditor).permit(:name, :url)
  end
end
