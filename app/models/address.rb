class Address < ApplicationRecord

  belongs_to :customer

  def full_address
     '〒' + postal_code + ' ' + address + ' ' + name
  end

  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true

end
