class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :categories, reject_if: :all_blank
  accepts_nested_attributes_for :comments, reject_if: :all_blank
=begin
  def comments_attributes=(comments_attributes)
    comments_attributes.values.each do |comment_attribute|
      comment = Comment.find_or_create_by(comment_attribute)
      #self.comments << comment
      self.comments.build(:content => comment)
    end
  end
=end

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attributes|
      if category_attributes[:name].present?
        category = Category.find_or_create_by(category_attributes)
        if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        end
      end
    end
  end

end
