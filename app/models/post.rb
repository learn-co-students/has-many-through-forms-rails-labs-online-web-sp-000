class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['content'].blank? } 
  accepts_nested_attributes_for :categories

  def unique_users
    self.users.uniq { |u| u.name }
  end

end
