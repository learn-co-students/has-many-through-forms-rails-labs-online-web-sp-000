class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def category_ids=(category_id_array)
    category_id_array.reject(&:empty?).each do |id|
      category = Category.find_by_id(id)
      self.categories << category
    end
  end

  def categories_attributes=(category_attributes_hash)
    category_attributes_hash.values.each do |category_attribute|
      if category_attribute["name"] != ""
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end
end
