class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments

  def comments_attributes=(comment_attributes)
    comment_attributes.values.each do |attr|
      comment = Comment.create(attr)
      self.comments << comment
    end
  end
end
