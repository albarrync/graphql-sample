class Types::CommentType < Types::BaseObject
  description "Returns a single Comment"

  field :id, ID, null: false
  field :body, String, null: true
end

class Types::CommentInputType < GraphQL::Schema::InputObject
  graphql_name "CommentInputType"
  description "Attributes for creating a Comment"
  
  argument :id, Int, required: false, camelize: false
  argument :body, String, required: false, camelize: false
  argument :post_id, Int, required: false, camelize: false

end