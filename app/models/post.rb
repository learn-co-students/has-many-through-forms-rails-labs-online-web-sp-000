class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
    
  def categories_attributes=(attributes)
    attributes.values.each do |attr|      
      # if !attr[:name].blank?
      if attr[:name].present?
        category = Category.find_or_create_by(attr)      
        
        # this was added in video - keeps from adding category if already assigned (not part of lab tests)
        if !self.categories.include?(category)
          # self.categories << category
          self.post_categories.build(category: category)
        end
      end
    end
  end
end
