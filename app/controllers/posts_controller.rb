class PostsController < ApplicationController

  def index
    if User.count > 0
      @post = Post.new
      @posts = Post.all
      @user = User.last
    else
      redirect_to new_user_path
    end
  end

  def create

      @post = Post.new(post_params)
      @post.user = User.last
      @post.save
      redirect_to posts_path

  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:content)
  end
end
