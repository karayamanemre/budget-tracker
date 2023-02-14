class ApplicationController < ActionController::Base
  before_action :update_signup_params, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    groups_index_path
  end

  protected

  def update_signup_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end
end
