module Mutations
  class DisablePost < Mutations::BaseMutation
    argument :id, ID, required: true

    field :result, Boolean, null: false
    
    def resolve(id:)
      check_authentication

      post = current_user.posts.find(id)
      { result: true } if post.destroy

    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end