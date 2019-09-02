class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def users_attributes=(attributes)
    user_attributes.values.each do |attribute|
      self.user = User.find_or_create_by(attribute)
    end
  end

  def user_username
    self.user.username
  end

end
