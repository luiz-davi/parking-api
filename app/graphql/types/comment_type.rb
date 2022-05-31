# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType
    field :post, Types::PostType
    field :message, String
   
    def user
      object.user
    end

    def post
      object.post
    end
  end
end
