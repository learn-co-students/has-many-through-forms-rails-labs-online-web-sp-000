class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  # def user=(name)
  #   self.username = User.find_or_create_by(name)
  # end

end
