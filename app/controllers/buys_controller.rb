class BuysController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @buy_from = BuyFrom.new
  end


  def create
    @buy_from = BuyFrom.new(buy_from_params)
    @item = Item.find(params[:item_id])
    if @buy_from.valid?
      pay_item
      @buy_from.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render  :index
    end
  end
  

  private
  def buy_from_params
    params.require(:buy_from).permit(:postal_code, :shipping_area_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_27383186c383973f7a70a922"
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_from_params[:token],
      currency: 'jpy'
    )
  end
end
