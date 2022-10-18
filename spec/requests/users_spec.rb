# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:other_user) { create(:user) }
  let(:user) { create(:user) }
  let(:authentication_params) do
    {
      authentication: {
        email: user.email,
        password: user.password
      }
    }
  end

  describe 'POST /users' do
    let(:user_params) do
      {
        user: {
          email: 'user@email.com',
          password: 'password',
          first_name: 'John',
          last_name: 'Doe'
        }
      }
    end

    it 'creates a new user' do
      expect { post('/users', params: user_params) }.to change { User.count }.by(1)
    end

    it 'responds with 201 status code when user is created' do
      post('/users', params: user_params)

      expect(response).to have_http_status(201)
    end

    it 'responds with descriptive error message' do
      post('/users', params: { user: { email: 'user@@emailcom', password: 'password' } })
      json_response = JSON.parse(response.body).with_indifferent_access
      expect(json_response[:error]).to eq('Validation failed: Email is invalid')
    end

    context 'when user already exists' do
      let!(:user) { create(:user, user_params[:user]) }

      it 'does not create a new user' do
        expect { post('/users', params: user_params) }.not_to(change { User.count })
      end

      it 'responds with 422 status code' do
        post('/users', params: { user: { email: 'user@@emailcom' } })

        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /users' do
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

    it 'responds with the user data' do
      post('/login', params: authentication_params)
      token = JSON.parse(response.body)['token']
      get "/users/#{user.id}", headers: { 'Authorization' => token }

      expect(response.body).to match(user.to_json)
    end
  end

  describe 'DELETE /users' do
    it 'soft deletes user' do
      post('/login', params: authentication_params)
      token = JSON.parse(response.body)['token']
      delete "/users/#{user.id}", headers: { 'Authorization' => token }
      expect(user.reload.deleted_at).not_to be_nil
    end

    it 'only allows user to delete their own account' do
      post('/login', params: authentication_params)
      token = JSON.parse(response.body)['token']
      delete "/users/#{other_user.id}", headers: { 'Authorization' => token }
      expect(other_user.reload.deleted_at).to be_nil
    end
  end

  describe 'PUT /users' do
    it 'updates user information' do
      post('/login', params: authentication_params)
      token = JSON.parse(response.body)['token']
      put "/users/#{user.id}", headers: { 'Authorization' => token }, params: { user: { first_name: 'Jimmy' } }
      expect(user.reload.first_name).to eq('Jimmy')
    end

    it 'only allows user to update their own account' do
      post('/login', params: authentication_params)
      token = JSON.parse(response.body)['token']
      put "/users/#{other_user.id}", headers: { 'Authorization' => token }, params: { user: { first_name: 'Jimmy' } }
      expect(other_user.reload.first_name).not_to eq('Jimmy')
    end
  end
end
