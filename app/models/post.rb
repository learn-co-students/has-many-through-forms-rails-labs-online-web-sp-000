class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :users, reject_if: :all_blank

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def commments_attributes=(comment_attributes)
    comment_attributes.values.each do |comment_attribute|
      comment = Comment.create(comment_attribute)
      self.comments << comment
    end
  end

  def users_attributes=(users_attributes)
    users_attributes.values.each do |users_attribute|
      user = User.find_or_create_by(user_attribute)
      self.users << user 
    end
  end

  def unique_users
    self.users.uniq
  end
end
