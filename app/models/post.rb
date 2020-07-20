class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: :reject_posts
 
  def comments_attributes=(comment_attributes)
     comment_attributes.values.each do |comment_attribute|
       comment = Comment.find_or_create_by(comment_attribute)
       self.comments << comment
    end
  end

  def reject_posts(attributes)
    attributes['name'].blank?
  end
end
