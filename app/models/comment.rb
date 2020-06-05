class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank?}

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attributes|
      if user_attributes[:username].present?
        user = User.find_or_create_by(user_attributes)
        if !self.user = user
          self.build_user(:username => user[:username])
        end
      end
    end
  end
  
  #ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"M6WiwSLMqzmFrO890ceCQLVE26w6do/etB9v4VC0xGKUw6y9xAOWYuQRiih9sFj/4qCzMA67lzBJlOSYxODkNA==", "comment"=>{"content"=>"Test 3", "user_id"=>"", "user_attributes"=>{"username"=>"lukethedog"}, "post_id"=>"2"}, "commit"=>"Create Comment", "controller"=>"comments", "action"=>"create"} permitted: false>
end
