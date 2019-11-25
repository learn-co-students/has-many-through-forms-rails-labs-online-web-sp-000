class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def username=(username)
    unless username == ""
      u = User.find_or_create_by(username: username)
      self.user = u
      self.save
    end
  end

  def user_id=(username)
    unless username == ""
      u = User.find_or_create_by(username: username)
      self.user = u
      self.save
    end
  end
end
