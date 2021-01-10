class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, -> { distinct }, through: :comments

  def categories_attributes=(category_hashes)
    category_hashes.each do |i, category_attributes|
      if category_attributes[:name].present?
        category = Category.find_or_create_by(name: category_attributes[:name])
        #self.categories << category
        if !self.categories.include?(category)
          self.post_categories.build(category: category)
        end
      end
    end
  end

  def comments_attributes=(comment_attributes)
    comment_attributes.values.each do |attribute|
      self.comments.build(comment)
    end
  end
  
end
