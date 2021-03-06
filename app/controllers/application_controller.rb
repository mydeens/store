class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def check_if_user_is_admin
    if !current_user.is_admin?
      redirect_to root_url, alert: "Access denied!!!"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :country_code, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :country_code, :phone_number])
  end

end
