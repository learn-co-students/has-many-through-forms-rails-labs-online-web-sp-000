class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:post).permit(:comment_content, :user_ids)
  end
end
