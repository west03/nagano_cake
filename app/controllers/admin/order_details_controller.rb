class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  
   # 違うテーブル
  def  order_detail_params
    params.req
  end
end
