class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @get_comments_usernames = []

    @post.comments.each do |c|
      @get_comments_usernames << c.user.username
    end

    @usernames = @get_comments_usernames.uniq
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    @post = Post.find(params[:id])
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
