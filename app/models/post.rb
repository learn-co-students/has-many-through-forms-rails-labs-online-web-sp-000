class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if !category_attribute[:name].empty?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category 
      end 
    end 
  end

  # def users_attributes=(user_attributes)
  #   user_attributes.values.each do |user_attributes|
  #     if !user_attributes[:username].empty?
  #       user = User.find_or_create_by(user_attributes)
  #       self.users << user 
  #     end 
  #   end 
  # end 

end
