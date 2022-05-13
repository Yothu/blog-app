class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    auth

    if @current_user.present?
      render json: { user: @current_user.name, token: @current_user.apitoken }, status: :ok
    else
      render json: { error: 'USER NOR FOUND', status: :not_found }
    end
  rescue StandardError => e
    render json: { error: e }, status: :ok
  end

  def auth
    user_real = User.find_by(apitoken: request.headers['Authorization'])
    sign_in(:user, user_real)
    @current_user = current_user
  end
end
