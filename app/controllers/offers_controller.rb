class OffersController < ApplicationController

  def show
    @item = Item.find(params[:item_id])
    @offer = Offer.find(params[:id])
  end

  def update
    offer = Offer.find(params[:id])
    offer.update(reply_params)
    redirect_to offer
  end

  private
  def reply_params
    params.require(:offer).permit(:accept)
  end

end
