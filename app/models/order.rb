class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, confirm_payment: 1, producting: 2, waiting_delivery: 3, start_delivery: 4 }
  
  def subtotal
    item.with_tax_price * count
  end
end
