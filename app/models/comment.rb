class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(user_attribute)
    if !user_attribute.blank?
      self.user = User.find_or_create_by(user_attribute)
    end
  end

end
