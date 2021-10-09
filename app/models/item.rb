class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_detail
  belongs_to :genre, optional: true

  validates :name, presence: true
  validates :image_id, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

  attachment :image

  def with_tax_price
    (price * 1.05).floor
  end
end
