class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new(item_params)
  end

   private

  def item_params
    params.permit(:name, :image_id, :ntroduction, :price, :is_active, :genre_id)
  end

end
