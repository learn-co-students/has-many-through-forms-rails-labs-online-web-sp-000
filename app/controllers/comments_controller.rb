

class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end































# class CommentsController < ApplicationController
#
#   def create
#
#     comment = Comment.create(comment_params)
#
#     binding.pry
#     redirect_to comment.post
#   end
#
#   private
#
#   def comment_params
#     params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
#   end
# end
#


 #
 #
 #  {"content"=>"comment1",
 #   "user_id"=>"2",
 #   "user_attributes"=>{"0"=>{"username"=>""}}},
 # "commit"=>"Create Comment",
 # "controller"=>"comments",
 # "action"=>"create"}
