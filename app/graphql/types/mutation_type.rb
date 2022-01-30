class Types::MutationType < Types::BaseObject
  # User Mutations
  field :create_user, Types::UserType, mutation: Mutations::CreateUser , description: "Create User"
  
  field :update_user, Boolean, null: false, description: "Update a User" do
    argument :user, Types::UserInputType, required: true
  end 

  def update_user(user:)
    User.where(id: user[:id]).first.update(user.to_h)
  end

  field :delete_user, Boolean, null: false, description: "Delete a User" do
    argument :id, ID, required: true
  end

  def delete_user(id:)
    User.where(id: id).first.delete
    true
  end

  # Post Mutations
  field :create_post, Types::PostType, mutation: Mutations::CreatePost, description: "Create Post"
  
  field :update_post, Boolean, null: false, description: "Update Post" do
    argument :post, Types::PostInputType, required: true
  end

  def update_post(post:)
    Post.where(id: post[:id]).first.update(post.to_h)
  end

  field :delete_post, Boolean, null: false, description: "Delete  User" do
    argument :id, ID, required: true
  end

  def delete_post(id:)
    Post.where(id: id).first.delete
    true
  end

  # Comment Mutations
  field :create_comment, Types::CommentType, mutation: Mutations::CreateComment, description: "Create Comment"

  field :update_comment, Boolean, null: false, description: "Update Comment" do
    argument :comment, Types::CommentInputType, required: true
  end

  def update_comment(comment:)
    Comment.where(id: comment[:id]).first.update(comment.to_h)
  end

  field :delete_comment, Boolean, null: false, description: "Delete Comment" do
    argument :id, ID, required: true
  end

  def delete_comment(id:)
    Comment.where(id: id).first.delete
    true
  end

end
