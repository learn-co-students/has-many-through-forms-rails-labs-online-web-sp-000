class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.comments.build
  end

def 