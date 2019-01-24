class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if !params[:comment][:user_attributes][:username].blank?
      new_user = User.create(username: params[:comment][:user_attributes][:username])
      comment.user = new_user
      comment.save
      redirect_to post_path(comment.post)
    else
      user = User.find(params[:comment][:user_id])
      comment.user = user
      comment.save
      redirect_to post_path(comment.post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
  # user_attributes:[:username, :email]
end
