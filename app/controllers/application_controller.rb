class ApplicationController < ActionController::Base
  before_action :update_signup_params, if: :devise_controller?

  protected

  def update_signup_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end
end
