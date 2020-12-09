class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @user = User.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if post_params[:category_ids] == [""] and post_params[:categories_attributes]["0"]["name"] == ""
      post = Post.create(title: params[:post][:title], content: params[:post][:content])
    else
      post = Post.create(post_params)
    end
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
