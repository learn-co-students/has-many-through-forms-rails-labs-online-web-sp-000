class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  def user_attributes=(user_attributes)
    user = User.find_or_create_by(user_attributes)
    self.user = user if user.valid?
  end

  def user_id=(id)
    self.user = User.find(id)
  end

  def user_name
    !!self.user ? self.user.username : nil
  end
end
