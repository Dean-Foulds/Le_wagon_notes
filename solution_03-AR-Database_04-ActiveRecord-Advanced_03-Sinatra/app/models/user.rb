class User < ActiveRecord::Base
  # Declare the relation between User and Post
  has_many :posts

  validates :username,  presence: true
  validates :email,     presence: true
end
