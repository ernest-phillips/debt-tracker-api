# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_many :loans
  # has_many :creditors, through: :loans
end
