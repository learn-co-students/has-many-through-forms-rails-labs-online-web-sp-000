class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user=(selected_user)
    User.find_or_create_by(username: selected_user)
  end
end
