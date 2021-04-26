class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories)
    categories.values.each do |c|
      category = Category.find_or_create_by(c)
      if category.name.empty? == false
        self.categories << category
      end
    end
  end


end
