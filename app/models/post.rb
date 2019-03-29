class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |c_attribute|
      category = Category.find_or_create_by(c_attribute)
      self.categories << category
    end
  end
  

 end
