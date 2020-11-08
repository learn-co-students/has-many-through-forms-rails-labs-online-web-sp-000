class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(hash)
    if !hash[:username].empty?
      newuser = User.find_or_create_by(username: hash[:username])
      self.user = newuser
      self.save
    end
  end

end
