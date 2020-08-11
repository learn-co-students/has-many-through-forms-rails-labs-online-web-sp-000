require 'pry'

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    
    # @comment = Comment.new    
    @users = User.all
    
    

    # @user = User.new   
    
    # @post.comments.build
  end

  def new
    @post = Post.new
    @categories = Category.all
    @post.categories.build
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
