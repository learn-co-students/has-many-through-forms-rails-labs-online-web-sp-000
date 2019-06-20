class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :any_blank?

  def any_blank?(att)
    !att.none?.blank? && new_record?
  end
end
