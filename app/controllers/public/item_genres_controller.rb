class Public::ItemGenresController < ApplicationController

  def show
    @genres = ItemGenre.all
    @genre = ItemGenre.find(params[:id])
    @items = @genre.items.page(params[:page])
  end
end
