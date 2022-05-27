module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def check_authentication
      raise GraphQL::ExecutionError, "Token required for this action." if context[:current_user].blank?
    end

    def current_user
      context[:current_user]
    end
  end
end
