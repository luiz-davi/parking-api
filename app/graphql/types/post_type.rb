# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :topic, String
    field :enabled, Boolean
    field :user, Types::UserType
    def user
      object.user
    end
  end
end
