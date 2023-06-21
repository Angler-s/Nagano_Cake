class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :cart_items
  has_many :orders
  has_many :destinations

  validates :last_name,       presence: true
  validates :last_name_kana,  presence: true
  validates :first_name,      presence: true
  validates :first_name_kana, presence: true
  validates :email,           presence: true, uniqueness: true
  validates :postal_code,     presence: true, format: { with: /\A\d{7}\z/ }
  validates :address,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/ }
  validates :phone_number,    presence: true, format: { with: /\A0\d{9,10}\z/}

  def full_name
    self.last_name + self.first_name
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
