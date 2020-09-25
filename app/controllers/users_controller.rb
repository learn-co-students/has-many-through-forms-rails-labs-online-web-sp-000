class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    
    @commented_posts = []
    @user.comments.each do |comment|
      if !@commented_posts.include?(comment.post)
        @commented_posts << comment.post 
      end 
    end 
  end

end
