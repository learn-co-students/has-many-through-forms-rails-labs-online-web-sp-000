class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(user_attribute_hash)
    if user_attribute_hash["username"] != ""
        # "username" => "Funzies"
      self.user = User.find_or_create_by(username: user_attribute_hash["username"])
    end
  end
end
