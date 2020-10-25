class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }
  # silently ignore any new record hashes if they fail to pass criteria; super helpful
  # Docs: https://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html

  def username
    self.user.username
  end
end
