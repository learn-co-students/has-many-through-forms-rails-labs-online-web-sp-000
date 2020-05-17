class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  # def user_attributes=(user_hash)
  #   self.user = User.find_or_create_by(user_hash)
  # end
end
