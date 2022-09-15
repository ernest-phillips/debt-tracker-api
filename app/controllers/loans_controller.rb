class LoansController < ApplicationController
  def create
  end

  private

  def loan_params
    params.require(:loan).permit(:name, :balance, :min_payment, :interest, :description)
  end
end
