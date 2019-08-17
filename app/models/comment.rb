require 'pry'
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

#  accepts_nested_attributes_for :user, reject_if:

  def user_attributes=(user_attributes)
    if (self.user_id == nil)
      user = User.find_or_create_by(username: user_attributes[:username])
      self.user_id = user.id
    end
 end

end
