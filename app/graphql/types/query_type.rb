module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Users
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false
    def user
      check_authentication

      current_user
    end

    # Posts
    field :posts, [Types::PostType], null: false
    def posts
      check_authentication
      
      Post.all.where(enabled: true).order("created_at DESC")
    end

    field :my_posts, [Types::PostType], null: false
    def my_posts
      check_authentication

      current_user.posts.where(enabled: true)
    end

    field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end
    def post(id:)
      check_authentication

      Post.find(id)
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end
