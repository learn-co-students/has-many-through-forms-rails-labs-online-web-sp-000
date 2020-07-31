class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  

  def user_attributes=(user_attributes)
    #binding.pry
    if user_attributes["username"] == ""
    
    else
      

        user = User.find_or_create_by(user_attributes)
        self.user = user
        #binding.pry
      
      
    end

  end
end
