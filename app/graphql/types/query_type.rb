module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.

    field :user, Types::UserType, null: true, description: "Returns a single user" do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find_by(id: id)
    end

    field :post, Types::PostType, null: true, description: "Returns a Post" do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.find_by(id: id)
    end

    field :posts, [Types::PostType], null: true, description: "Returns all Posts of User" do
      argument :user_id, ID, required: true
    end
    def posts(user_id:)
      Post.where(user_id: user_id)
    end

    field :comment, Types::CommentType, null: true, description: "Returns a Comment" do
      argument :id, ID, required: true
    end
    def comment(id:)
      Comment.find_by(id: id)
    end

    field :comments, [Types::CommentType], null: true, description: "Returns all Comments of a Post" do
      argument :post_id, ID, required: true
    end
    def comments(post_id:)
      Comment.where(post_id: post_id)
    end

    field :login, String, null: true, description: "Logs a user in." do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "Returns Logged In User"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false

    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end
  end
end
