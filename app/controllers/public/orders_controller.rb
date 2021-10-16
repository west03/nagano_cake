class Public::OrdersController < ApplicationController

   before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def show
    @order = Order.find(params[:id])
  end

  def comfirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:customer_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
  end

  def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.save
     current_customer.cart_items.each do |cart_item|
      # 注文履歴にデータを残す
      # =の左側はなんでもいい（モデルに合わせると他の人が見やすい）
       @order_detail = OrderDetail.new
       @order_detail.order_id = @order.id
       @order_detail.item_id = cart_item.item_id
       @order_detail.amount = cart_item.amount
       @order_detail.price = (cart_item.item.with_tax_price*cart_item.amount)
       @order_detail.save
     end
    # カートの中を空にして再度新しいカートで買い物ができる
     current_customer.cart_items.destroy_all
     redirect_to orders_complete_path
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(
      :payment_method, :postal_code, :address, :name, :customer_id, :postage_cost, :total_payment, :status,
      address:[:postal_code, :address, :name])
  end

end
