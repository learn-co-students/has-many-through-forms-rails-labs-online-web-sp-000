class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.comments.build
  end


  private 
  def user_params 
    params.require(:user).permit(:username, comment_attributes: [:content])
  end 
end 