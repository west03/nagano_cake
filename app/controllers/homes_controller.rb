class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(created_at: :desc)
    
  end

end
