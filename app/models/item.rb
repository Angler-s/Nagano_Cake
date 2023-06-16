class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :item_genre
  
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_availabled, presence: true,
             numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
              format: { with: /\A[0-9]+\z/ }
  
end
