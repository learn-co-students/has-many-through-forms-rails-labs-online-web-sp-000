class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments



  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |categories_attribute|
      if categories_attribute[:name].present?
        category = Category.find_or_create_by(categories_attribute)
        self.post_categories.build(category: category)
      end
    end
  end

end
