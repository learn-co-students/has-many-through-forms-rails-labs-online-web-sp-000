class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories 

  def categories_attributes=(cats_atts)
    cats_atts.values.each do |cat_att|
      if !cat_att[:name].empty?
        category = Category.find_or_create_by(cat_att)
        self.post_categories.build(category: category)
      end
    end
  end

  def unique_users
    self.users.uniq
  end
  

end
