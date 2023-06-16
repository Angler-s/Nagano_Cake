class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :item_genre, foreign_key: 'genre_id'

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
              format: { with: /\A[0-9]+\z/ }
  
  validates :is_availabled, presence: true

  def get_item_image(width, heigh)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image-jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, heigh]).processed
  end


end
