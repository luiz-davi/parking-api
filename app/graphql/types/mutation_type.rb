module Types
  class MutationType < Types::BaseObject
    # users
    field :sigin_in, mutation: Mutations::SiginIn
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :desable_user, mutation: Mutations::DesableUser
    field :restore_user, mutation: Mutations::RestoreUser

    # posts
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost

    #comments
    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
