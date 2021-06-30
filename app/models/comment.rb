class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def comment_user_id=(id)
    @user = User.find(id)
    self.user = @user
  end

  def comment_user_id
    self.user ? self.user.id : nil
  end

end
