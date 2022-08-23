# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # describe "GET /new" do
  # it "returns http success" do
  #   get "/users/new"
  #   expect(response).to have_http_status(:success)
  # end
  # end

  describe 'POST /users' do
    it 'creates a new user' do
      user_params = {
        user: {
          email: 'user@email.com',
          password: 'password',
          first_name: 'John',
          last_name: 'Doe'
        }
      }

      post '/users', params: user_params
      # RSpec matchers
      expect(User.find_by(email: 'user@email.com')).to eq 1
    end
  end
end
