class AuthTokenService
  HMAC_SECRET = 'my$secret'
  def self.call(password)
    payload = { password: }
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end
end
