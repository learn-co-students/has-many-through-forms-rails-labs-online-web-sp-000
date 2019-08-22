class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    if !user_id
      user = User.find_or_create_by(user_attributes)
      self.user = user
    else
      self.user = User.find(user_id)
    end
  end
end
