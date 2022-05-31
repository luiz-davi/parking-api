module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :post_id, ID, required: true
    argument :message, String, required: true

    type Types::CommentType

    def resolve(**params)
      check_authentication
      
      params[:user_id] = current_user.id
      comment = Comment.create(params)

      comment
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end