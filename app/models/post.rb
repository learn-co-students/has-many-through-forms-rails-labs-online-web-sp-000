class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories # all this does is add methods
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments, reject_if: :reject_comments
  #accepts_nested_attributes_for :users 

  def reject_comments(comment_attributes)
    comment_attributes[:content].blank?
  end 

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |i, categories_attributes|
      # i need to create a category that's already asspociated with 
      # this post and I need to make sure that this category already 
      # does'nt exist by name.
      if categories_attributes[:name].present?

        category = Category.find_or_create_by(name: categories_attributes[:name])
        if !self.categories.include?(category) 
          self.post_categories.build(:category => category)
        end 
      end 
    end
    # raise categories_hashes.inspect 
  end 

  def user_attributes(user_hashes)
    # i need to create a user that's already asspociated with 
      # this post and I need to make sure that this user 
      # does'nt exist
      user_hashes.each do |u, user_attributes|
        if user_attributes[:username].present? 
          user = User.find_or_create_by(username: user_attributes[:username])
          if !self.users.include?(user)
            self.users.build(:user => user)
          end 
        end 
      end
  end 
  #build association writer to build association based on nested params 
  # def categories_attributes=(category_attributes)
  #   # iterate over category attr and determine if need 
  #   # to create new or find existing category 
  #   category_attributes.values.each do |category_name|
  #     category = Category.find_or_create_by(category_name)
  #   end 
  #   self.categories << category
  # end 
end
