class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all 
  end
  
  def create
    customer = current_customer
    item = Item.find(params[:id])
    cart_item_new = customer.CartItem.new(cart_item_params)
    if CartItem_item.find_by(item_id:item, customer_id:customer ).present?
      cart_item = find_by(item_id:item, customer_id:customer )
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.save
      redirect_to cart_items_path
    else cart_item_new.save
      redirect_to cart_items_path
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)

  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
  end
  
  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy
    @cart_items = CartItem.all
  end
  
  private
  def cart_item_params
    params.require(:item).permit(:customer_id, :item_id, :count)
  end
  
end
