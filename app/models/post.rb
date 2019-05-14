class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def unique_commentors
    unique_user_list = []
    self.comments.each do |comment|
      if !unique_user_list.include?(comment.user)
        unique_user_list << comment.user
      end
    end
    unique_user_list
  end
end
