class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
  	 category_attributes.values.each do |category_attribute|
  	 	 category = Category.find_by(name: category_attribute[:name])

       if !category.nil?
         self.categories << category
       else
        self.categories << Category.create(name: category_attribute[:name]) unless category_attribute[:name].empty?
  	   end
     end

  end

end
