class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :user_reject?

  def user_reject?
    users_attributes[:username].blank? || users_attributes[:email].blank?
  end

  def user_attributes=(user)
    self.user = User.find_or_create_by(username: user[:username])#, email: user[:email])
    self.user.update(user)
  end

  def user_name=(name)
    self.user = User.find_or_create_by(username: name)
  end
  
  def user_name
    self.user ? self.user.name : nil
  end
end
