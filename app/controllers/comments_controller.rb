class CommentsController < ApplicationController

  def create
    # binding.pry
    if comment_params[:user_attributes]["username"].empty?
      comment = Comment.create(params.require(:comment).permit(:content, :post_id, :user_id))
      redirect_to comment.post
    else
      comment = Comment.create(comment_params)
    redirect_to comment.post
    end
  end

  private

  def comment_params
    # binding.pry
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
