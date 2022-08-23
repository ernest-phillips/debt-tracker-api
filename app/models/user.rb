# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_validation

  def email_validation
    if email.blank?
      errors.add(:email, "can't be blank")
    end
  end
end
