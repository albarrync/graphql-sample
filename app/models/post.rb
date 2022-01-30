class Post < ApplicationRecord
  belongs_to :user

  validates_length_of :body, minimum: 10
  validates_presence_of :body
end
