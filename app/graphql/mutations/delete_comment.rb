module Mutations
  class DeleteComment < Mutations::BaseMutation
    argument :id, ID, required: true

    field :result, Boolean, null: false

    def resolve(id:)
      check_authentication
      
      comment = current_user.comments.find_by!(id: id)

      { result: true } if comment.really_destroy!

    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end