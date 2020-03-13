class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
    #binding.pry
  end

  def user_params
    params.require(:user).permit(:username, :email, user_attributes:[:username, :email])
  end

end
