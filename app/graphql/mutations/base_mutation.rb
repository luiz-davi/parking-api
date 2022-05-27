module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def check_authentication
      raise GraphQL::ExecutionError, "Token required for this action." if context[:current_user].blank?
    end

    def current_user
      context[:current_user]
    end
  end
end
