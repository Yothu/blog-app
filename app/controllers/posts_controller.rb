class PostsController < ApplicationController
  load_and_authorize_resource

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
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to "/users/#{post.author.id}/posts/#{post.id}"
      flash[:success] = 'Post was created!'
    else
      redirect_to '/posts/new'
      flash[:error] = 'ERROR! Post was not created.'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.author.update(posts_counter: post.author.posts_counter - 1)
    post.delete
    redirect_to root_path, notice: 'Post was deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
