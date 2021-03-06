class UsersController < ApplicationController
  skip_before_action :check_user
  load_and_authorize_resource

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end

  helper_method :asd
end
