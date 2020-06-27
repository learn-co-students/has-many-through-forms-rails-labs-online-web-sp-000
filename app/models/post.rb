class Post < ActiveRecord::Base

  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attributes[:name].present?
        category = Category.find(category_attribute)
      else
        category = Category.create(category_attribute)
        self.categories << category
      end
    end
  end

end
