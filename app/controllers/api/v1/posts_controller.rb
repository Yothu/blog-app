class Api::V1::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.posts, status: :ok
  rescue StandardError => e
    render json: { error: e }, status: :ok
  end

  def show
    user = User.find(params[:user_id])
    post = user.posts.find(params[:id])
    render json: post, status: :ok
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end
end
