class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  private

  def comment_params
     params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
