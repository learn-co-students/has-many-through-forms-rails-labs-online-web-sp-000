class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @users = User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    3.times do
      @post.categories.build(:name => "sample category")
    end
  end

  def create

    post = Post.create(post_params)

    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end

#
# {"utf8"=>"✓",
#  "authenticity_token"=>
#   "y/ZgWgVmdGLnjMEEzP3W683cp26Nq/GAcD0vpRS4By9eIXd/7Lzjm9rYbUxwTu8mZfSDdYdJ4Bu1oLZS0CgXvA==",
#  "post"=>
#   {"title"=>"post2",
#    "content"=>"content2",
#    "category_ids"=>[""],
#    "categories_attributes"=>{"0"=>{"name"=>"category2"}}},
#  "commit"=>"Create Post",
#  "controller"=>"posts",
#  "action"=>"create"}
