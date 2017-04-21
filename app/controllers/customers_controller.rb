class CustomersController < ApplicationController
  def index
  end

  def show
    if customer_signed_in?
      @customer= Customer.find(params[:id])
      unless current_customer.id == @customer.id
        flash[:danger] = "You don't have access to that !"
        redirect_to customer_path(current_customer.id)
      end
    else
      flash[:danger] = "You don't have access to that !"
      redirect_to root_path
    end
  end
  def update

  end
end
