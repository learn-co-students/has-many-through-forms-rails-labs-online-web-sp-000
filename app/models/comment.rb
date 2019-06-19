class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  # def user_attributes=(username)
  #   # binding.pry
  #   if !username.empty?
  #     self.user = User.find_or_create_by(username: username)
  #     self.user.update(username)
  #   end
  # end

end
