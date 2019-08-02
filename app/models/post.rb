class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def commentors
    commentors_array = []
    self.comments.each do |comment|
      commentors_array << comment.user if !comment.user.nil?
    end
    commentors_array.uniq
  end

end
