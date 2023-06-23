class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :item_genre, foreign_key: 'genre_id'
  has_many :cart_items
  has_many :order_items

  validates :name, presence: true
  validates :introduction, presence: true
  validates :item_image, presence: true
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }


  scope :recentry_items, -> { order(created_at: :desc).limit(4)}

  def get_item_image(width, height)
    item_image.variant(resize_to_fill: [width, height]).processed
  end


  def status
    if is_availabled? == true
      "販売中"
    else
      "販売停止中"
    end
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name","introduction"]
  end

end

