class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:comment][:post_id])
    @username = User.find_or_create_by(username: params[:username][:username])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @username.id if !!@username
    @comment.save
    redirect_to post_path(@post)
  end

  private

  def comment_params
     params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
