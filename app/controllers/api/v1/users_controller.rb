class Api::V1::UsersController < ApplicationController
  def index
    if @current_user.present?
      users = User.all
      render json: users, status: :ok
    end
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end
end