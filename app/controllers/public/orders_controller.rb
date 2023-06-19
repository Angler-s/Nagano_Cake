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
    @order_items = @order.order_items.all
  end

  def confirm
    customer = current_customer
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: customer.id)
    send_to = params[:order][:send_to]
    destination = Destination.find(params[:order][:destination_id])
    if send_to == "customer_address"
      @order.postal_code = customer.postal_code
      @order.address = customer.address
      @order.name = customer.full_name
    elsif send_to == "recorded_destination"
      @order.postal_code = destination.postal_code
      @order.address = destination.address
      @order.name = destination.name
    end
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price = @total_price + cart_item.subtotal
    end
    @order.amount_billed = @total_price
    @destination = full_address
  end

  def create
    customer = current_customer
    order = Order.new(order_params)
    order.customer_id = customer.id
    cart_items = CartItem.where(user_id: customer.id)
    if order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = order.id
        order_item.count = cart_item.count
        order_item.price = cart_item.item.with_tax_price
        order_item.save
      end
      cart_items.destroy_all
      redirect_to conmplete_orders_path
    else
      render 'new'
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :amount_billed)
  end

  def full_address
    @order.postal_code + @order.address + @order.name
  end

end
