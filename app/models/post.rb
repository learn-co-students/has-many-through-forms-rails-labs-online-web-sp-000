class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  # {"title"=>"grayson's post 2", "content"=>"content of the post", "category_ids"=>["", "1"], "categories"=>{"name"=>"newish"}}
  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attributes|
      category = Category.find_or_create_by(category_attributes)
      self.categories << category
    end
  end

end
