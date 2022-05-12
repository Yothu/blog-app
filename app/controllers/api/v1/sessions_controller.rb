module Api
  module V1
    class Api::V1::SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])

        if user.correct_password?(params[:token])
          sign_in(:user, user)
          render json: { message: current_user }, status: :ok
        else
          render json: { error: 'nah men...' }
        end
      end
    end
  end
end
