require 'rails_helper'

RSpec.describe 'Loans', type: :request do
  describe 'POST /loans' do
    
    user =  create(:user)
    creditor = create(:creditor) 
   
    let(:loan_params) do
      {
        loan: {
          name: 'Student Loan',
          balance: 1000,
          min_payment: 50,
          interest: 0.05,
          description: 'My student loan',
          creditor_id: creditor.id,
          user_id: user.id
        }
      }
    end

    it 'creates a new loan' do
      expect{ post('/loans', params: loan_params) }.to change { Loan.count }.by(1)
    end
  end
end
