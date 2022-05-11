module Api
  module V1
    class Api::V1::PostsController < ApplicationController
      def index
        @user = User.find(params[:user_id])
        render json: @user.posts, status: :ok
      end

      def show
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        render json: @post, status: :ok
      end
    end
  end
end
