class Post < ActiveRecord::Base
  has_many :categories
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end 
  end 

  # def categories_attributes=(categories_hashes)
  #   categories_hashes.each do |index, category_attributes|
  #     post.categories.find_or_create_by(name: category_attributes[:name])
  #     category = Category.find_or_create_by(name: cat_data[:name])
  #     self.post_categories.build(:category => category)
  #   end
  # end

  def saved_comments
    self.comments.reject{ |c| !c.persisted?}
  end

  def commentors
    self.comments.map { |comment| comment.user }.uniq.reject { |user| user.username.nil? }
  end

end
