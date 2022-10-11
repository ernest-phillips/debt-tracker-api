# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  TOKEN_DURATION = 24.hours.to_i

  def self.encode(payload)
    expiration_date = Time.zone.now + TOKEN_DURATION
    payload[:exp] = expiration_date.to_i
    { token: JWT.encode(payload, SECRET_KEY), exp: expiration_date.strftime('%m-%d-%Y %H:%M') }
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
