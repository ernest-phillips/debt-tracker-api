require 'rails_helper'

RSpec.describe 'Loans', type: :request do
  describe 'POST /loans' do
   before do
     @user = create(:user)
     @creditor = create(:creditor)
   end
   
    let(:loan_params) do
      {
        loan: {
          name: 'Student Loan',
          balance: 1000,
          min_payment: 50,
          interest: 0.05,
          description: 'My student loan',
          creditor_id: @creditor.id,
          user_id: @user.id
        }
      }
    end

    it 'creates a new loan' do
      expect{ post('/loans', params: loan_params) }.to change { Loan.count }.by(1)
    end

    it 'deletes a loan' do
      loan = create(:loan)
      expect{ delete("/loans/#{loan.id}") }.to change { Loan.count }.by(-1)
    end

    it 'updates a loan' do
      loan = create(:loan)
      loan_params[:loan][:name] = 'New Loan Name'
      put("/loans/#{loan.id}", params: loan_params)
      expect(loan.reload.name).to eq('New Loan Name')
    end

    it 'returns a list of loans' do
      create(:loan)
      get('/loans')
      expect(response).to have_http_status(:ok)
    end
  end
end
