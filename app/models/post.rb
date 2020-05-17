class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_hash)
    unless category_hash.value?("")
      self.categories << Category.find_or_create_by(category_hash)
    end
  end

  def unique_users
    self.users.uniq
  end
end