class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @user = @comment.build_user
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @category = @post.categories.build
  end

  def create
    # puts params
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
