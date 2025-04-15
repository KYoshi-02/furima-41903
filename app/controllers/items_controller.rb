class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :item_description, :item_status_id, :item_category_id, :shipping_cost_id,
      :shipping_date_id, :prefecture_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
