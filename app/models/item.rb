class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_detail
  belongs_to :genre

   attachment :image
end
