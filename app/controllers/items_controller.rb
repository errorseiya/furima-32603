class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :edit_Identification, only: [:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  

  private

  def item_params 
    params.require(:item).permit(
      :image, :name, :comment, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_Identification
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path  
    end
  end
end
