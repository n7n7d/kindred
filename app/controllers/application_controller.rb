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
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |customer_params|
      customer_params.permit(:name)
    end
    devise_parameter_sanitizer.permit(:account_update) do |customer_params|
      customer_params.permit(:name)
    end
  end

  def after_sign_in_path_for(seller)
   seller_path(current_seller.id)
  end

  def after_sign_in_path_for(customer)
    customer_path(current_customer.id)
  end

end
