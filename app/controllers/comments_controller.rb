class CommentsController < ApplicationController

  def create
    if comment_params[:user_attributes][:username].empty?
      params_minus_attributes = comment_params.except(:user_attributes)
      comment = Comment.create(params_minus_attributes)
      redirect_to post_path(comment.post)
    else
      comment = Comment.create(comment_params)
      redirect_to post_path(comment.post)
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
