require 'jwt'

class Api::AuthenticationTokenService
  
  HMAC_SECRET = "my$ecretK3y"
  ALGORITHM_SECRET = "HS256"


  def self.call(id)
    payload = { id: id }
      
    JWT.encode(payload, HMAC_SECRET, ALGORITHM_SECRET)
  end
  
  def self.decode(token)
    p token
    decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_SECRET }
    decoded_token[0]['id']
  end
end