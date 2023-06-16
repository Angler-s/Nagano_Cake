class ItemGenre < ApplicationRecord
  has_many :items, foreign_key: "genre_id"
end
