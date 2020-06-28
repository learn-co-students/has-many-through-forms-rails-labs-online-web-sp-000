class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id]) 
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end 

  def create
    #raise params.inspect 
    post = Post.create(post_params)

    if post.save 
      #binding.pry 
      redirect_to post
    end 
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comment_attributes: [:content], user_attributes: [:username])
  end
end
