class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories # all this does is add methods
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :categories

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |i, categories_attributes|
      # i need to create a category that's already asspociated with 
      # this post and I need to make sure that this category already 
      # does'nt exist by name.
      if categories_attributes[:name].present?

        category = Category.find_or_create_by(name: categories_attributes[:name])
        if !self.categories.include?(category) 
          self.post_categories.build(:category => category)
        end 
      end 
    end
    # raise categories_hashes.inspect 
  end 
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
