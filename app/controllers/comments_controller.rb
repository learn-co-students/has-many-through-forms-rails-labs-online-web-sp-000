class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)

    if params[:comment][:user_id].blank?
      comment.user = User.find_or_create_by(username: params[:user][:username])
    end
    comment.save
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
