class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    binding.pry
    self.user = User.create(user_attributes)
  end

  def user_name
    self.user.username
  end
end
