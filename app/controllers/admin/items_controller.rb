class Admin::ItemsController < ApplicationController

  def new
    @item = item.new
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to 'admin_item_path(item)'
    
  end
  
  def show
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
