require 'jwt'

class Api::AuthenticationTokenService
  prepend SimpleCommand
  include ActiveModel::Validations
  
  HMAC_SECRET = "my$ecretK3y"
  ALGORITHM_SECRET = "HS256"

  def initialize(id)
    @id = id
  end

  def call
    generate_token
  end

  private

    def generate_token
      payload = { id: @id }
      
      JWT.encode(payload, HMAC_SECRET, ALGORITHM_SECRET)
    end
end