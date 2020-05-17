class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    if user_attributes[:username] != nil
      user = User.create(user_attributes)
      self.user = user
      self.save
    end
  end

  def user_id=(id)
    user = User.find(id)
    self.user = user
    self.save
  end

  def username
    self.user.username
  end

end
