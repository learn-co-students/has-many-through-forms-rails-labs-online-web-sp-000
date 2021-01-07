require "pry"

class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  def user=(user)
    self.user = User.find_or_create_by(name: user[:username])
    self.user.update(user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, users_attributes: [:username])
  end
end
