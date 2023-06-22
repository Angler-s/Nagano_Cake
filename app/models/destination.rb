class Destination < ApplicationRecord
  belongs_to :customer

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address,     presence: true, format: { with: /\A[ぁ-んァ-ン[ ][　]一-龥a-zA-Z]+\z/ }
  validates :name,        presence: true, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/ }

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
