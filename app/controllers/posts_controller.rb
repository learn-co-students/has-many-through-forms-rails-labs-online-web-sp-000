class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # @comment = @post.comments.build(content:"")
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    @comment = @post.comments.build(content:"")
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    post = Post.find(params[:id])
    binding.pry
    post.update(post_params)
    binding.pry
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comments_attributes: [:content])
  end
end
