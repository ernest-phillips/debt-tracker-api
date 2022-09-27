class LoansController < ApplicationController
  def create
    Loan.create!(loan_params)
    render json: { message: 'Loan created' }, status: :created
  end

  def index
    render json: Loan.all
  end

  def update
    loan = Loan.find(params[:id])
    loan.update!(loan_params)
    render json: { message: 'Loan updated' }, status: :ok
  end

  def destroy
    Loan.find(params[:id]).destroy
    render json: { message: 'Loan deleted' }, status: :ok
  end

  private

  def loan_params
    params.require(:loan).permit(:name, :balance, :min_payment, :interest, :description, :creditor_id , :user_id)
  end
end
