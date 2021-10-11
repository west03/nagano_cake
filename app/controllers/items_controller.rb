class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
    @item = Item.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
