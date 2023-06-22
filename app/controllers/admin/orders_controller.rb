class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: @customer.id).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer_id
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    if @order.update(order_params)
      @order_items.update_all(status: "waiting_product") if @order.status == "confirm_payment"
    end

    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status, :customer_id)
  end

end
