class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :blank_username

  def blank_username(attributes)
    attributes[:username].blank?
  end

end
