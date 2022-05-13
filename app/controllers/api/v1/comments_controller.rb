class Api::V1::CommentsController < ApplicationController
  def index
    puts "CURRENT USER: #{@current_user} IN COMMENT INDEX"

    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])

    render json: post.comments, status: :ok
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end

  def show
    puts "CURRENT USER: #{@current_user} IN COMMENT SHOW"

    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    comment = post.comments.find(params[:id])

    render json: comment, status: :ok
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end

  def create
    auth
    comment = Comment.new(comment_params)
    comment.author = @current_user
    comment.post_id = params[:post_id]

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unproccessable_entity
    end
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def auth
    user_real = User.find_by(apitoken: request.headers['Authorization'])
    sign_in(:user, user_real)
    @current_user = current_user
  end
end

# curl --header "Content-Type: application/json" --request POST
# --data '{"text": "this is my comment from a curl!!!"}'
# http://localhost:3000/api/v1/users/1/posts/2/comments -v

# curl -v http://localhost:3000/api/v1/users/1/posts/2/comments
# -X POST -H "Content-type: application/json" -d '{"text": "this is my comment from a curl!!!"}'