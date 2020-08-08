class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }

  def post_id=(id)
    self.post = Post.find(id)
    self.save
  end

  def user_id=(id)
    self.user = User.find(id)
    self.save
  end

  def user_attributes=(attribute)
    self.user = User.find_or_create_by(attribute) if attribute[:username] != ""
    self.save
  end
end