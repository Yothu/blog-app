class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user
  protect_from_forgery with: :null_session

  def self.current
    @current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def check_user
    if request.headers['Authorization'].present?
      user_real = User.find_by(apitoken: request.headers['Authorization'])

      render json: { error: 'NO USER WITH THAT TOKEN' }, status: :not_found if user_real.nil?
      sign_in(:user, user_real) unless user_real.nil?
      @current_user = current_user unless user_real.nil?
    else
      render json: { error: 'NO TOKEN DETECTED' }, status: :not_found
    end
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end
end
