class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum status: { do_not_start: 0, waiting_product: 1, producting: 2, completed_product: 3 }
end
