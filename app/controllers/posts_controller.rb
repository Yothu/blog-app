class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:success] = 'Post was created!'
      redirect_to "/users/#{@post.author.id}/posts/"
    else
      flash.now[:alert] = 'ERROR! Post was not created.'
      render :new
    end
  end
end
