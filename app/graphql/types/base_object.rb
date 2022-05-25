module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def check_login
      raise GraphQL::ExecutionError, "Login to get access" if context[:current_user].blank?
    end
  end
end
