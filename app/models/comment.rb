class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def users_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      if user_attribute["username"].present?
        user = user.find_or_create_by(user_attribute)
      end
    end
  end

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
  end

end
