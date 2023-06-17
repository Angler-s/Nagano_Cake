class Admin::ItemsController < ApplicationController

  def new
    @genres = ItemGenre.pluck(:name, :id)
    @item = Item.new
  end

  def create
    @genres = ItemGenre.pluck(:name, :id)
    item = Item.new(item_params)
    item.save!
    redirect_to admin_item_genres_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_availabled, :item_image)

  end

end
