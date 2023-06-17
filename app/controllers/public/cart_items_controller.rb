class Public::CartItemsController < ApplicationController
  def index
  end
  
  def create
    @user = current_usser
    @item = Item.find(params[:id])
    CartItem.find_by(customer_id:@user, item_id:@item)
    
    @cart_item = @user.CartItem.new(cart_item_params)
    @cart_item
    
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)

  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end
  
  def destroy_all
    @cart_items = CartItem.all
    @cart_item.destroy
  end
  
  private
  def cart_item_params
    params.require(:item).permit(:customer_id, :item_id, :count)
  end
  
end
