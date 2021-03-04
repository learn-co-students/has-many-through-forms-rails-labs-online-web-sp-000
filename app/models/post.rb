class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :users

  
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |cat_att|
    #thing_attributes.VALUES.each because it's a hash, and we want only the values
      if cat_att.present?
        #i.e. if it isn't an emtpy string
      category = Category.find_or_create_by(name: cat_att)
      #Find or create the category by the name of the thing
      self.post_categories.build(category: category)
      #Separates the act of creating the cateogry from the act of creating the post with the category
      end 
    end
  end
  
end




#   belongs_to :user
#   belongs_to :post
#   accepts_nested_attributes_for :category
