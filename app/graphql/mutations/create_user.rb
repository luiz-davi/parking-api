module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :phone, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, String, null: true

    def resolve(**params)
      user = User.new(params)
      
      return { user: user, errors: "" } if user.save!

      return { user: nil, errors: user.errors }
      
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end