module Mutations
  class RestorePost < Mutations::BaseMutation
    argument :id, ID, required: true

    field :post, Types::PostType, null: true
    field :error, String, null: true

    def resolve(id:)
      check_authentication

      post = current_user.posts.only_deleted.find_by!(id: id)
      
      if post.restore(:recursive => true)
        post.restore(:recursive => true)
        { post: post, error: "" }
      else
        { post: nil, error: "Incorrect password"}
      end
      
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end