class Post < ActiveRecord::Base
  has_many :post_categories # all this does is add methods
  # what methods:
  # post categories
  # #post_categories<<
  # #post_categories.delete
  # #post_category_ids=ids

  has_many :categories, through: :post_categories
  # #category_ids
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_hashes)
    # {"0"=>{"name"=>"new category 1"}, "1"=>{"name"=>"new category 2"}}
    # how would i create a category for each of the hashes inside category_hashes
    categories_hashes.each do |i, category_attributes|
      # DO NOT CREATE A CATEGORY IF IT DOESN'T HAVE A NAME
      if category_attributes[:name].present?

        category = Category.find_or_create_by(name: category_attributes[:name])
        if !self.categories.include?(category)
          # I need to create a category that is already associated with this post
          # and I need to make sure that category already doesn't exist by name.
          # Why wouldn't I now want to push `category` into `self.categories` like -- `self.categories << category`?
          # Because it would be inefficient (it would return all categories)
          self.post_categories.build(:category => category)
        end
      end
    end

  end
end
