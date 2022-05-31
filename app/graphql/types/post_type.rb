# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :topic, String
    field :enabled, Boolean
    field :user, Types::UserType
    field :comments, [Types::CommentType]
    
    def user
      object.user
    end
    
    def comments
      object.comments
    end
  end
end
