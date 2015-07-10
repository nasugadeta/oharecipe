class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    #user新規登録
    devise_parameter_sanitizer.for(:sign_up) << :family_name
    devise_parameter_sanitizer.for(:sign_up) << :given_name
    #user編集
    # devise_parameter_sanitizer.for(:edit) << :family_name
    # devise_parameter_sanitizer.for(:edit) << :given_name
  end
end
