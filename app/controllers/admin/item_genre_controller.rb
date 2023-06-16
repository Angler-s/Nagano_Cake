class Admin::ItemGenreController < ApplicationController
  
   def index
    @item_genre = ItemGenre.new
    @item_genre = Itemgenre.all
  end
  
  def create
  end

  def edit
  end
  
  def update
  end
end
