class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }

  def user_attributes=(user_attributes)
    if !user_attributes[:username].blank?
      user = User.create(username: user_attributes.values.first)
      user.comments << self
    end
  end

end
