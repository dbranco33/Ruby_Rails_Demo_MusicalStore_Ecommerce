class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  # Rails 4.x.x and newer
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name,:address,:email,:province_id,:password,:password_confirmation])
  end
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
