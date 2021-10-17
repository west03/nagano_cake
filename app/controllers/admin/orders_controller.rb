class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
  @order = Order.find(params[:id])
  # 購入者のデータを取得（@orderに紐付いているorder_details）
  @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    # updateの引数が違う。正しくはストロングパラメータで記入
    if @order.update(order_params)
      redirect_to  admin_order_path(@order.id)
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
