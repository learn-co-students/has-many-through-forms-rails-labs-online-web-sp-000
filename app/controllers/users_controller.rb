class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new 
  end 

  def create 
    @user = User.create(user_params)
    @user.save 
  end 

  private 
  def user_params 
    params.permit(:user).require(:username, :email)
  end 
  
end 