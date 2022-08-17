# frozen_string_literal: true

class User < ApplicationRecord
  REGEX_PATTERN = /^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/
  def is_email_valid? email
      email =~REGEX_PATTERN
  end
end
