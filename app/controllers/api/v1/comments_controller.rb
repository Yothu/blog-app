module Api
  module V1
    class Api::V1::CommentsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        post = user.posts.find(params[:post_id])

        render json: post.comments, status: :ok
      end

      def show
        user = User.find(params[:user_id])
        post = user.posts.find(params[:post_id])
        comment = post.comments.find(params[:id])

        render json: comment, status: :ok
      end

      def create
        
      end
    end
  end
end
