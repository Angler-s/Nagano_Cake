class Public::HomesController < ApplicationController
  def top
    @genres = ItemGenre.all
    @items = Item.recentry_items
  end

  def about
  end
end
