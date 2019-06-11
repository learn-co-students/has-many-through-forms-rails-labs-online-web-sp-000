class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :comments


def post_commentors
  self.comments.collect do |comment|
    comment.user
  end.uniq
end

end
