class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user)
    unless (user[:username] == "") || (user[:username] == nil)
    self.user = User.find_or_create_by(username: user[:username])
    self.save
    end
  end

end
