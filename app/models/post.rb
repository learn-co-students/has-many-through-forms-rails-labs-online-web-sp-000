class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def categories_attributes=(attrs)
    if attrs["0"][:name] != ""
      self.categories << Category.find_or_create_by(name: attrs["0"][:name])
      self.save
    end
  end

  def unique_users
    unique_users = []
    self.users.map do |user|
      if !unique_users.include?(user)
        unique_users << user
      end
    end
    unique_users
  end
end
