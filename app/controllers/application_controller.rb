class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # before_action :authenticate_user_api
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_user_api
    user = User.find_by(email: params[:email])

    if user.correct_password?(params[:token])
      sign_in(:user, user)
      # render json: { message: current_user }, status: :ok
    else
      render json: { error: 'nah men...' }
    end
  end
end
