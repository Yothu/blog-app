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
        comment = Comment.new(comment_params)
        comment.author_id = params[:user_id]
        comment.post_id = params[:post_id]

        if comment.save
          render json: comment, status: :created
          redirect_to '/api/v1/users'
        else
          render json: comment.errors, status: :unproccessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end

# curl --header "Content-Type: application/json" --request POST
# --data '{"text": "this is my comment from a curl!!!"}'
# http://localhost:3000/api/v1/users/1/posts/2/create -v

# curl -v http://localhost:3000/api/v1/users/1/posts/2/comments
# -X POST -H "Content-type: application/json" -d '{"text": "this is my comment from a curl!!!"}'
