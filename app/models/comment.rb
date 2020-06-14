class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
	accepts_nested_attributes_for :user 

	def user_attributes=(username)
		user = User.find_or_create_by(username)
		self.user = user unless user.username == ""
	end
end
