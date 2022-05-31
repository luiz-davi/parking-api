module Mutations
  class RestoreUser < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :error, String, null: true

    def resolve(email:, password:)
      user = User.only_deleted.find_by!(email: email)
      
      if user.authenticate(password)
        user.restore(:recursive => true)
        { user: user, error: "" }
      else
        { user: nil, error: "Incorrect password"}
      end
      
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end