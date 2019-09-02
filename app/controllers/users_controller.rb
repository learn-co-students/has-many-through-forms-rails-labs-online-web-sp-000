class UsersController < ApplicationController

  def create
    user = User.create(:user)
  #  redirect_to comment.post
  end

  def show
    @user = User.find(params[:id])
  end

end
