class BuyersController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @buyer_address = BuyerAddress.new 
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_address_params)  
     if @buyer_address.valid?
       @buyer_address.save
       redirect_to root_path
     else
       render action: :index
     end
  end


  private

  def buyer_address_params
    params.require(:buyer_address).permit(
      :postal_code, :prefecture_id, :municipality, :address, :building_name, 
      :phone_number).merge(buyer_id: current_user.id, item_id: params[:item_id])
  end

end
