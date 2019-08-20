class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :blank_username?

  def author_username
    self.user.username
  end

  def blank_username?(attributes)
    attributes['username'].blank?
  end


end
