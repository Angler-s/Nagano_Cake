class Public::ItemGenresController < ApplicationController

  def show
    @genres = ItemGenre.all
    @genre = ItemGenre.find(params[:id])
    @items = @genre.items.page(params[:page])
    @q = Item.ransack(params[:q])
  end
end
