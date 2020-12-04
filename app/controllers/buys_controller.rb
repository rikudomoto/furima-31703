class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @buy_from = BuyFrom.new
    if (@item.user_id == current_user.id) || @item.buy
    redirect_to root_path
   end
  end

  def create
    @buy_from = BuyFrom.new(buy_from_params)
    if @buy_from.valid?
      pay_item
      @buy_from.save
      redirect_to root_path
    else
      render  :index
    end
  end

  private

  def buy_from_params
    params.require(:buy_from).permit(:postal_code, :shipping_area_id, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    # Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp.api_key = Payjp.setSecretKey(process.env.PAYJP_SECRET_KEY);
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_from_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
