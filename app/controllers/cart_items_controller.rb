class CartItemsController < ApplicationController
  def index
  end

  def create
    @cart_item = current_customer.cart_item.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.seve
      redirect_to cart_items_path
    elsif
      @cart_item = current_customer.cart_item.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path
    else
      render :items/show
    end
  end

  def update
  end

  def destroy
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
