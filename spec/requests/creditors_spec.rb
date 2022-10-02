# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creditors', type: :request do
  describe 'POST /creditors' do
    let(:creditor_params) do
      {
        creditor: {
          name: 'Big Bank',
          url: 'https://www.bigbank.com',
        }
      }
    end

    it 'creates a new creditor' do
      expect { post('/creditors', params: creditor_params) }.to change { Creditor.count }.by(1)
    end

    it 'responds with 201 status code when creditor is created' do
      post('/creditors', params: creditor_params)

      expect(response).to have_http_status(201)
    end
  end
end
