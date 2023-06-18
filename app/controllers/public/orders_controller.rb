class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def confirm
    @order_items
  end

  def complete
  end
end
