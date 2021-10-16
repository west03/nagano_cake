class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.addresses
    @address = Address.new
    @customer = current_customer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    # f.hiddenから受け取る変数が必要
    @customer = current_customer
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
       @addresses = Address.all
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code, :customer_id)
  end

end
