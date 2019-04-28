class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, :reject_if => :empty_fields

  def empty_fields(attributed)
    attributed[:username].blank?
  end
end
