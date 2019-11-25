class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  validates :username, length: { minimum: 2 }
  accepts_nested_attributes_for :comments

end
