class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    if @order_item.update(order_item_params)
       redirect_to admin_order_path(@order)
    else
      render 'Orders#show'
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end
end
