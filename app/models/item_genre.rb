class ItemGenre < ApplicationRecord
  has_many :items, foreign_key: "genre_id"

  validates :name, presence: true,  confirmation: { type: :name, message: :blank }
end
