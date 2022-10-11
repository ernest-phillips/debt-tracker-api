# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /authentications' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
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

    it 'responds with 401 status code if user is not authenticated' do
      get('/users/3', headers: { 'Authorization' => 'invalid token' })

      expect(response).to have_http_status(401)
    end

    it 'responds with 403 status if user is forbidden' do
      post('/login', params: authentication_params)
      token = JSON.parse(response.body)['token']
      get "/users/#{other_user.id}", headers: { 'Authorization' => token }

      expect(response).to have_http_status(403)
    end
  end
end
