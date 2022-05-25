class Mutations::SiginIn < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :token, String, null: true
  field :user, Types::UserType, null: true

  def resolve(email:, password:)
    user = User.find_by!(email: email)
    
    raise GraphQL::ExecutionError, "Wrong password" unless user.authenticate(password)

    { 
      token: Api::AuthenticationTokenService.call(user.id),
      user: user
    }

  rescue ActiveRecord::RecordNotFound => e
     raise GraphQL::ExecutionError, e.message
  end
end
