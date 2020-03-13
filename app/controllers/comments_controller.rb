class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    comment.post = Post.find_by(id: params[:comment][:post_ids])
    comment.save
    #binding.pry
    # if params[:user][:username]
    #   user = User.create(params[:user])
    #   comment.user = user
    #   comment.save
    # end

    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username, :email])
  end

end
