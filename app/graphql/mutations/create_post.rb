module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :topic, String, required: true

    type Types::PostType

    def resolve(**params)
      check_authentication

      params[:user_id] = current_user.id
      post =  Post.create(params)

      post
    end
  end
end