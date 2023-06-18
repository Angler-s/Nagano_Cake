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
    # @order = Order.find(params[:id])
    # @order_items = @order.order_items.all
    #OrderItems.find_by(@order.id)
    #@order_items = OrderItems.all
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    send_to = params[:order][:send_to]
    destination = Destination.find(params[:order][:destination_id])
    if send_to == "customer_address"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.full_name
    elsif send_to == "recorded_destination"
      @order.postal_code = destination.postal_code
      @order.address = destination.address
      @order.name = destination.name
    end
    @destination = full_address
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name)
  end

  def full_address
    @order.postal_code + @order.address + @order.name
  end
end
