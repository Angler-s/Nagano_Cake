class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :count, numericality: { greter_than: 0, less_than: 11 }

  def subtotal
    item.with_tax_price * count
  end
end
