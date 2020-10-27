class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: proc {|atts| atts['username'].blank? || User.find_by(username: atts['username']) }
end
