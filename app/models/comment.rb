class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def users_attributes_username=(user_attributes)
    user_attributes.values.each do |user_attribute|
      user = User.find_or_create_by(user_attribute)
      self.users << user
    end
  end

  def users_attributes_username
    self.user ? self.user.name : nil
  end

end
