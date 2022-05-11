module Api
  module V1
    class Api::V1::UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
      end
    end
  end
end
