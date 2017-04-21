class SellersController < ApplicationController

  def show
    if seller_signed_in?
    @seller= Seller.find(params[:id])
     unless current_seller.id == @seller.id
      flash[:danger] = "You don't have access to that !"
      redirect_to seller_path(current_seller.id)
     end
    else
      flash[:danger] = "You don't have access to that !"
      redirect_to root_path
    end

  end


  def index
  end
  protected

  def seller_params
    params.require(:seller).permit(:name, :address, :phone_number, :company,:password, :password_confirmation)
  end

end
