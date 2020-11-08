class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def categories_attributes=(cat_attributes) #our custom setter 
    #we'll be passed a hash like this { "0" => {"name="=>"faf"}, "1" => {"name"=>"duma"}}
    #actually its just one, not two things inside the hash, but we're future proofing
    cat_attributes.values.each do | cat_attribute|
      if !cat_attribute[:name].empty? #to prevent the hash with name "" to get created
      category = Category.find_or_create_by(cat_attribute)
      self.categories << category
      end
    end

  end

end
