class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |index, category_attribute|
      if category_attribute[:name].present?
        category = Category.find_or_create_by(name: category_attribute[:name])
        self.post_categories.build(:category => category) unless self.categories.include?(category)
      end
    end
  end
end
