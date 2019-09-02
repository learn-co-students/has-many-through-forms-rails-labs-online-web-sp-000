class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    @commented_posts = @comments.collect{|comment| comment.post}.uniq
  end

end
