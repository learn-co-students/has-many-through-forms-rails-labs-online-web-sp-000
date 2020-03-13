class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['user_id'].blank? }
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.post_categories.build(category: category)
    end
  end

  def unique_users
    user_collection = self.comments.collect do |comment|
      comment.user
    end

    user_collection.uniq
  end

  # def commentors
  #   binding.pry
  #   commenter_array = self.comments.collect do |comment|
  #     comment.user
  #   end
  # end

end
