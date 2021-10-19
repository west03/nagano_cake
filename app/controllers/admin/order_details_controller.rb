class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!


  def update
    # params[変数]はroutesのurlと同じにする
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to  admin_order_path(@order.id)
    else
      render :show
    end
  end

  private

   # 違うテーブル
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
