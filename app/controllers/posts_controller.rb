class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments, comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
      flash[:success] = 'Post was created!'
    else
      redirect_to '/posts/new'
      flash[:error] = 'ERROR! Post was not created.'
    end
  end
end
