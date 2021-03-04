class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    #@comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post 
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
    #Category_IDs to identify the categories already existing to associate the post with
    #Categories_attributes to create a new category to associate the post with, see: model methods
  end
end
