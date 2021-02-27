class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attributes= ( cat_array ) 
    if !(cat_array.values[0][:name] == "" || cat_array.values[0][:name] == nil)  
      cat_array.values.each do | cat |
        #binding.pry
        category = Category.find_or_create_by(cat)
        self.categories << category
      end
    end
  end

end
