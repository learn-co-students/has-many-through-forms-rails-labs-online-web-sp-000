class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :user_reject?

  def user_reject?(attributes)
    attributes[:username].blank?
  end

  def users_attributes=(user)
    self.user = User.find_or_create_by(username: user[:username])
    self.user.update(user)
  end
end
