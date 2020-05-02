class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      #self.categories << category  #inefficient because it returns all categories
      self.post_categories.build(category: category)
    end
  end

  def unique_users
    users = []
    comments.each do |comment|
      if !users.include?(comment.user)
        users.push(comment.user)
      end
    end
    users
  end
end
