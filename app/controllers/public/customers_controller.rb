class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    # ログイン中のidだけが欲しいので.idを書く
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    # find_byはid以外を取得する (探すカラム名: params[:値])
    @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_dy(name: params[:name])
    @customer.update(is_active: false)
    # セッション情報（ログイン情報）をリセット
    reset_session
    redirect_to root_path
  end

  private
  # フォームに入力したものを持ってくるメソッド params.require（テーブル名）.permit（カラム名）
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
