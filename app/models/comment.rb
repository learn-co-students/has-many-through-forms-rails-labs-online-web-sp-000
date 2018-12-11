class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :all_blank       # Not sure about this!

end


# accepts_nested_attributes_for :user, reject_if: :reject
#
#  def reject(attributes)
#    attributes['username'].blank?
#  end
