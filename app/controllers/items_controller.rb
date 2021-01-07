class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item .save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def prototype_params  # プライベートメソッド
    params.require(:item).permit(
      :image, :name, :comment, :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end
end
