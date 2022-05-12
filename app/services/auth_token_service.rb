class AuthTokenService
  HMAC_SECRET = 'my$secret'
  def self.call(email, password)
    payload = { email: email, password: password}
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end
end
