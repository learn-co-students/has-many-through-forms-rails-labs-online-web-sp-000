class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def users_attributes=(user_attributes)
    if !user_attributes[:username].empty?
      self.user = User.find_or_create_by(user_attribute)
    end
  end 

end
