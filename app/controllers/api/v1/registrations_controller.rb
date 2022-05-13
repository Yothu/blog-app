class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :check_user

  def create
    user = User.new(user_params)

    if params[:user][:email].present? && params[:user][:password].present?
      user.apitoken = AuthTokenService.call(params[:email], params[:password])
      user.confirmed_at = Time.now
      if user.save
        render json: { message: 'Signed Up!', email: user.email, token: user.apitoken }, status: :ok
      else
        render json: { error: 'EMAIL ALREADY EXISTS!', status: :forbidden }
      end
    else
      render json: { error: 'PARAMETER EMAIL AND/OR PASSWORD ARE/IS MISSING', status: :not_acceptable }
    end
  rescue StandardError => e
    render json: { error: e }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end