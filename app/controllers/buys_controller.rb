class BuysController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @buy_from = BuyFrom.new
  end


  def create
    @buy_from = BuyFrom.new(buy_from_params)
    if @buy_from.valid?
      
      @buy_from.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render  :index
    end
  end
  

  private
  def buy_from_params
    params.require(:buy_from).permit(:postal_code, :shipping_area_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
