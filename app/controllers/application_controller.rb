class ApplicationController < ActionController::Base
  before_filter :set_current_user
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that find_by_id(nil) returns nil
    @current_user ||= Moviegoer.find_by_id(session[:user_id])
    
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :email, :password, :password_confirmation, :current_password)}
    devise_parameter_sanitizer.for(:sign_in) { |a| a.permit(:login, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) {|a| a.permit(:username, :email, :password, :password_confirmation, :current_password)}
  end
  protect_from_forgery with: :exception
end