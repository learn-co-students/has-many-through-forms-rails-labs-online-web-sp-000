class Post < ActiveRecord::Base

  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def unique_users    
    unique_user_comments = self.comments.uniq {|comment| comment.user_id}

    unique_users =[]
    unique_user_comments.each do |comment|
      unique_users << User.find(comment.user_id)
    end
    unique_users
  end

end
