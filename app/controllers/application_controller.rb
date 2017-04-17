class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Rails 4.x.x and newer
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name,:address,:email,:province_id,:password,:password_confirmation])
  end
end
