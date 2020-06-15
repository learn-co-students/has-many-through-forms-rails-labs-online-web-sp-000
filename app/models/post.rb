class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories #this macro does not contain a 'reject_if: proc { |attributes| attributes[:name].blank? }' option because the #categories_attributes=() method is custom defined below -- 'reject_if' macro would just be ignored

  def categories_attributes=(cat_attr)
    cat_attr.values.each do |cat|
      if !cat[:name].blank?
        category = Category.find_or_create_by(cat)
        if !self.categories.include?(category)
          self.categories << category
        end
      end
    end
  end

end
