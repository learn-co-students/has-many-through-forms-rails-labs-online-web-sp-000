class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    if !user_attributes[:username].empty?
      user = User.find_or_create_by(username: user_attributes[:username])
      self.user = user
      self
    end
  end
  
end
