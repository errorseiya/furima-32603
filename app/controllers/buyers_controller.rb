class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item


  def index
    @buyer_address = BuyerAddress.new 
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_address_params)  
     if @buyer_address.valid?
       pay_item
       @buyer_address.save
       redirect_to root_path
     else
       render action: :index
     end
  end
  


  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]# 秘密鍵の環境変数
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def buyer_address_params
    params.require(:buyer_address).permit(
      :postal_code, :prefecture_id, :municipality, :address, :building_name, 
      :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    # もし@itemにbuyerがあれば戻す記述
    redirect_to root_path if @item.buyer.present? 
  end

end
