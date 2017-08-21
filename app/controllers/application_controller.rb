class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :user
      "login"
    elsif current_user.admin?
      "admins"
    else
      "application"
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
  end
end
