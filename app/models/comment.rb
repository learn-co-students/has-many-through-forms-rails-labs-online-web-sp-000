class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(user_params)
    unless user_params[:username].blank?
      self.user = User.find_or_create_by(username: user_params[:username], email: user_params[:email])
    end
  end

end
