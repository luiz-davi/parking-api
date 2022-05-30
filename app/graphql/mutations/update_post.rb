module Mutations
  class UpdatePost < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :topic, String, required: false

    type Types::PostType

    def resolve(id:, **params)
      check_authentication

      post = current_user.posts.find(id)

      post.update!  (params)

      post

    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end