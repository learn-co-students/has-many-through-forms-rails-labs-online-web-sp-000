class CommentsController < ApplicationController

  def create
    # binding.pry
    if params[:comment_user_attributes_username] == ""
      comment = Comment.create(comment_params)
      # binding.pry
      redirect_to comment.post
    else
    # binding.pry
    comment = Comment.new
    user = User.find_or_create_by(username: params[:comment_user_attributes_username])
    comment.content = params[:comment][:content]
    comment.post_id = params[:comment][:post_id]
    comment.user_id = user.id
    # binding.pry
    comment.save
    redirect_to comment.post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
