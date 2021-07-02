class CommentsController < ApplicationController

  def create
    byebug
    comment = Comment.create(comment_params)
    if !params[:comment][:user_id]
      @new_user = User.create(params[:user_attributes])
      comment.user = @new_user
    end
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
