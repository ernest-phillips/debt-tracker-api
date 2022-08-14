class User < ActiveRecord::Base
  attr_accessor :email, :password, :first_name, :last_name, :password_confirmation

  def initialize(email, password, first_name, last_name, password_confirmation)
    @email = email
    @password = password
    @first_name = first_name
    @last_name = last_name
    # @password_confirmation = password_confirmation
  end
end
