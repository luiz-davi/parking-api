module Mutations
  class UpdateUser < Mutations::BaseMutation
    argument :name, String, required: false
    argument :email, String, required: false
    argument :phone, String, required: false

    type Types::UserType

    def resolve(**params)
      check_authentication
      
      current_user.update!(params)

      current_user

    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end