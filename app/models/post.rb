class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  #build association writer to build association based on nested params 
  # def categories_attributes=(category_attributes)
  #   # iterate over category attr and determine if need 
  #   # to create new or find existing category 
  #   category_attributes.values.each do |category_name|
  #     category = Category.find_or_create_by(category_name)
  #   end 
  #   self.categories << category
  # end 
end
