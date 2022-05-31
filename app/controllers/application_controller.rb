class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token

  private

    def current_user
      token, _options = token_and_options(request)
      return nil if token.blank?
      id = Api::AuthenticationTokenService.decode(token)
      User.find(id)

    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
end
