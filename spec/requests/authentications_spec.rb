# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /authentications' do
    let(:user) { create(:user) }
    let(:authentication_params) do
      {
        authentication: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'responds with 200 status code when authentication is successful' do
      post('/login', params: authentication_params)

      expect(response).to have_http_status(200)
    end

    it 'responds with 401 status code when authentication is unsuccessful' do
      post('/login', params: { authentication: { email: 'user@@emailcom' } })

      expect(response).to have_http_status(401)
    end
  end
end
