class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def category=(selected_category)
    Category.find_or_create_by(name: selected_category)
  end
end
