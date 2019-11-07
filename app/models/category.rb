class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  def categeory_attributes=(category_attributes_hash)
    category_attributes_hash.each do |index|
      Category.find_or_create(name: index[:name])
    end
  end

end
