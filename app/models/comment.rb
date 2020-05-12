class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  def user_attributes=(attr)
    if attr[:username] != ''
      user = User.find_or_create_by(username: attr[:username])
      self.user_id = user.id
      self.save
    end
  end
end
