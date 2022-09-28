# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
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
end
