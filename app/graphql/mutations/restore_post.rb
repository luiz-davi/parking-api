module Mutations
  class RestorePost < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::PostType

    def resolve(id:)
      check_authentication

      post = current_user.posts.only_deleted.find_by!(id: id)
      
      post if post.restore(:recursive => true)
       
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end