require 'pry'
class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: proc {|category| category[:name].blank?}
  
  # def category_attributes=(category_attributes)
  #   category_attributes.values.each do |category|
  #     if category[:name].present?
  #       self.categories << Category.find_or_create_by(category)
  #     end
  #   end
  # end


end
