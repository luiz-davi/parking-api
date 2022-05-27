module Types
  class MutationType < Types::BaseObject
    field :sigin_in, mutation: Mutations::SiginIn
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
  end
end
