class Loan < ActiveRecord::Base
  attr_accessor :loan_type, :creditor, :description, :user, :initial_balance, :minimum_payment, :interest_rate

  def initialize()
    @loan_type = loan_type
    @creditor = creditor
    @description = description
    @user = user
    @initial_balance = initial_balance
    @minimum_payment = minimum_payment
    @interest_rate = interest_rate
  end

end
