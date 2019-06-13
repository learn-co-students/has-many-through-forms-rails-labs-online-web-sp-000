class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user_attributes=(attributes)
    username = attributes[:username]
     if !username.blank?
       user = User.find_or_create_by(username: username)
       self.user_id = user.id
     end
    self.save
  end

  def user_attributes
  end

end
