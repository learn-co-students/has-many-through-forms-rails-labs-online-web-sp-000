class CommentsController < ApplicationController

  def create
    if (params[:comment][:user_attributes][:username] == "")
      comment = Comment.create(comment_params(:content, :user_id, :post_id))
    else
      comment = Comment.create(comment_params(:content, :post_id, :user_id, user_attributes:[:username]))
    end
    redirect_to comment.post
  end

  private

  def comment_params(*args)
    params.require(:comment).permit(*args)
  end
end
