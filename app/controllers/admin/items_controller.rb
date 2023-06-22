class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @genres = ItemGenre.pluck(:name, :id)
    @item = Item.new
  end

  def create
    @genres = ItemGenre.pluck(:name, :id)
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(item)
    else
      @genres = ItemGenre.pluck(:name, :id)
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).per(10)
    @q = Item.ransack(params[:q])
  end

  def edit
    @genres = ItemGenre.pluck(:name, :id)
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(item)
    else 
      @genres = ItemGenre.pluck(:name, :id)
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_availabled, :item_image)

  end

end
