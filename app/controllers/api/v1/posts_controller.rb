module Api
  module V1
    class Api::V1::PostsController < ApplicationController
      def show
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])

        render json: @post.comments, status: :ok
      end
    end
  end
end
