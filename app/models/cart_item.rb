class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def subtotal
    self.amount*item.with_tax_price
  end
end