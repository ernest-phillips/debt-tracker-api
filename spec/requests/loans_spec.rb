require 'rails_helper'

RSpec.describe 'Loans', type: :request do
  describe 'POST /loans' do
    let(:loan_params) do
      {

      }
    end

    it 'creates a new loan' do
      expect{ post('/loans', params: loan_params) }.to change { Loan.count }.by(1)
    end
  end
end
