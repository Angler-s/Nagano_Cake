class Public::ItemsController < ApplicationController

  def index
    @genres = ItemGenre.all
    @items = Item.page(params[:page])
    @item_all = Item.all
    @q = Item.ransack(params[:q])
  end

  def show
    @genres = ItemGenre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



  def search
    @genres = ItemGenre.all
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).page(params[:page])
  end

end