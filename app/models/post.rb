class Post < ActiveRecord::Base
  has_many :post_categories  #all this does is to add methods
  #what methodes
  #post_categories
  #post|_categories<<
  #post_categories.delete
  #collection _singular_ids=ids post_category_ids=ids
  has_many :categories, through: :post_categories  #all this does is to add methods
  #what methodes
  #collection _singular_ids=ids category.ids
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :categories #ima dole metod koji preventuje duplikacije

  def categories_attributes=(categories_hashes) #only creating a new category if it doesn't already exist with the current name
    categories_hashes.each do |index, category_attribute|
      # DO NOT CREATE CATEGORY IF IT DOESEN'T HAVE NAME
      if category_attribute["name"].present?#IF NAME PRESENT THAT DO AL FOLLOWING moglo je i kao if !category_attribute.blink
        category = Category.find_or_create_by(category_attribute)
        #But also don't add a category to a post if already exist
        #How do I check if this post has category already? - following code
        #if !self.category.include?(category) # can with: unless self.category.inclyde?(category)
        self.post_categories.build(category: category)
        # self.categories << category #First, we call self.categories, which returns an array of Category objects, and then we call
         # the shovel (<<) method to add our newly found or created Category object to the array.
         #this is inefficient becouse returns all categories
         #self.post_categories.build(:category => category)y object to the array.
        #end
      end
    end
  end
end
