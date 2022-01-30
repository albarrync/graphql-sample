class Types::UserType < Types::BaseObject
  description "Returns a User"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: true
  field :full_address, String, null: true
  field :email, String, null: true
  field :is_superadmin, Boolean, null: true, camelize: false

  def full_address
    ([object.street, object.suite_number, object.city, object.country, object.zip_code]).join(" ")
  end

  def self.visible?(context)
    !!context[:current_user]
  end
end

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "Attributes for creating a User"
  
  argument :id, Int, required: false, camelize: false
  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :street, String, required: false, camelize: false
  argument :suite_number, String, required: false, camelize: false
  argument :city, String, required: false, camelize: false
  argument :zip_code, String, required: false, camelize: false

end
