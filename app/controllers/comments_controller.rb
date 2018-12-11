class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    binding.pry

    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end

# {"utf8"=>"✓",
#  "authenticity_token"=>
#   "A1l8fwU/6NjQGdpqnjuNfEleSg46N/1pi+0JIU33YzPq2o9LNGDZf63q1N/j0CsuultrFXco/LFhfnUTeenENw==",
#  "comment"=>{"content"=>"comment5", "user"=>"1"},
#  "commit"=>"Create Comment",
#  "controller"=>"comments",
#  "action"=>"create"}
