class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    if comment_params[:user_id] == ""
      user = User.find_or_create_by(username: comment_params[:user_attributes][:username])
      comment = Comment.create(comment_params)
      comment.user = user
      comment.save
      # puts "BLANK" + user.id.to_s
    else
      comment = Comment.create(comment_params.except(:user_attributes))
      # puts "SELECT" + comment_params[:user_id]
    end
    # binding.pry
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
