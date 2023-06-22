class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page]).per(10)
    @q = Item.ransack(params[:q])
  end

  def order_index
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: @customer.id).order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :address, :postal_code, :phone_number, :email, :is_deleted)
  end

end
