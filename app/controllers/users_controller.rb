class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end

  helper_method :asd
end
