class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItems.where(order_id: params[[:id]])
    if @order.update(order_params)
      @order_items.update_all(status: 1) if @order.status == "payment_confirmed"
    end

  redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
