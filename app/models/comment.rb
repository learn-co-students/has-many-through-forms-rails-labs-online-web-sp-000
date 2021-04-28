class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :reject_users # should use one of the existing relationships

  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.categories << category
  #   end
  # end

  def users_attributes=(user_attributes)
    attributes.values.each do |user_attributes|
      user = User.find_or_create_by(user_attributes)
      #  binding.pry
    end
  end

  def reject_users(attributes)
    attributes['username'].blank? || attributes['email'].blank?
  end
end
