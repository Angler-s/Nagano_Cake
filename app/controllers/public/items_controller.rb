class Public::ItemsController < ApplicationController
  def index
    @genres = ItemGenre.all
    @items = Item.page(params[:page])
  end

  def show
    @genres = ItemGenre.all
    @item = Item.find(params[:id])
  end
end
