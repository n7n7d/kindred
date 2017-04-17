class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |seller_params|
      seller_params.permit(:name, :address, :phone_number, :company)
    end
    devise_parameter_sanitizer.permit(:account_update) do |seller_params|
      seller_params.permit(:name, :address, :phone_number, :company)
    end
  end
end
