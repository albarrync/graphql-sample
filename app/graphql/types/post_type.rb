class Types::PostType < Types::BaseObject
  description "Returns a single Post"

  field :id, ID, null: false
  field :title, String, null: false
  field :body, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: true
  field :user_id, ID, null: true

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| {field_name: e, errors: object.errors[e] }}
  end
end

class Types::PostInputType < GraphQL::Schema::InputObject
  graphql_name "PostInputType"
  description "Attributes for creating a Post"
  
  argument :id, Int, required: false, camelize: false
  argument :body, String, required: false, camelize: false
  argument :title, String, required: false, camelize: false
  argument :user_id, Int, required: false, camelize: false
end

