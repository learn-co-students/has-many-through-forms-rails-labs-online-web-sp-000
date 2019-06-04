class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: :all_blank

  def comments_attributes=(comments_attributes)
    comments_attributes.values.each do |comment_attribute|
      comment = Comment.find_or_create_by(comment_attribute)
      self.comments << comment
    end
  end



end
