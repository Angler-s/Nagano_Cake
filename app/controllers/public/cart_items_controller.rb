class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    customer = current_customer
    item = Item.find(params[:cart_item][:item_id])
    cart_item_new = customer.cart_items.new(cart_item_params)
    if CartItem.find_by(item_id:item.id, customer_id:customer ).present?
      cart_item = CartItem.find_by(item_id:item, customer_id:customer )
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.save
      redirect_to cart_items_path
    else cart_item_new.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path

  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end

end
