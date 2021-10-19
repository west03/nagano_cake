class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find(params[:id])
      @genres = Genre.all
    end

    def update
      @genres = Genre.all
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to admin_item_path
      else
        render :edit
      end
    end

   private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end


end
