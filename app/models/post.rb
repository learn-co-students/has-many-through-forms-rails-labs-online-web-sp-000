class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments


  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |name|
      self.categories << Category.find_or_create_by(name)
    end
  end
  
end
