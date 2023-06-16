class Admin::ItemsController < ApplicationController

  def new
  end
  
  def create
    
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
  
end
