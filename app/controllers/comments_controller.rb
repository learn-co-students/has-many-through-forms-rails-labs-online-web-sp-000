class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to comment_path(comment)
  end

  def show
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
