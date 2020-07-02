class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_array)
    category_array.each do |i, category|
      if category[:name].present?
        category = Category.find_or_create_by(category)
        self.post_categories.build(category: category) if !self.categories.include?(category)
      end
    end
  end
end
