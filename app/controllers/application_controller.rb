class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      case resource
      when User
        recipes_path
      when Admin
        restaurant_path(current_admin.id)
      end
  end


  protected
  def configure_permitted_parameters
    #user新規登録
    devise_parameter_sanitizer.for(:sign_up) << :family_name
    devise_parameter_sanitizer.for(:sign_up) << :given_name
    # user編集
    devise_parameter_sanitizer.for(:account_update) << :family_name
    devise_parameter_sanitizer.for(:account_update) << :given_name
  end
end
