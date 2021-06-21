class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(attributes)
    if attributes[:username] != ""
      self.user = User.find_or_create_by(attributes)
    end
   
  end

end
