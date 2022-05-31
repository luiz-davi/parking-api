module Mutations
  class UpdateComment < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :message, String, required: false

    type Types::CommentType

    def resolve(id:, **params)
      check_authentication

      comment = current_user.comments.find(id)

      comment.update!(params)

      comment

    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.message
    end

  end
end