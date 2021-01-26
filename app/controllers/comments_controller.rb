class CommentsController < ApplicationController

  def create
    puts params
    comment = Comment.create(comment_params)
    if(params[:comment][:user_attributes][:username].blank?)
      comment.user = User.find(params[:comment][:user_id])
      comment.save
    end
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
