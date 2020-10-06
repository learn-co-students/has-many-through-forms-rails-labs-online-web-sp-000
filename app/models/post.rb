class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories

	def categories_attributes=(category_attributes)
			category_attributes.values.each do |category_attribute|
				category = Category.find_or_create_by(category_attribute)
				if !category.name.empty?
					self.categories << category
				end
			end
  end

  ##def categories_ids=(ids)
	##	if !ids.empty?
	##		ids.each {|id| self.categories << Category.find(id)}
	##	end
	##end

	def one_user_comment
		self.comments.map{|c| c.user}.uniq
	end
	

end
