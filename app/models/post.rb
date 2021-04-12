class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: :blank_category
  accepts_nested_attributes_for :comments, reject_if: :blank_comment

  def blank_category(attributes)
    attributes[:name].blank?
  end

  def blank_comment(attributes)
    attributes[:content].blank?
  end

end
