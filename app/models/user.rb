class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  # Time for a comment!
end
