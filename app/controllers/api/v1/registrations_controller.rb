module Api
  module V1
    class Api::V1::RegistrationsController < ApplicationController
      def create
        user = User.new(user_params)
        user.apitoken = AuthTokenService.call(params[:email], params[:password])
        user.confirmed_at = Time.now

        if user.save
          render json: { email: user.email, token: user.apitoken }, status: :ok
        else
          render json: { error: 'Email already exist or paramters missing' }
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
    end
  end
end
