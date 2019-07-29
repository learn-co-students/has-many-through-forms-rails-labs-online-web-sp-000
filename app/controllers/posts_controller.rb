class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @user = User.new
    @comment.user = @user
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    post = Post.create(post_params)
    if post.categories.empty?
      nil_category = Category.find_or_create_by(name: "")
      post.categories << nil_category
    end
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
