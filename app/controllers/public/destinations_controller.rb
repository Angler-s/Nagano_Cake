class Public::DestinationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @destination = Destination.new
    @destinations = @customer.destinations
  end

  def create
    @destination = current_customer.destinations.build(destination_params)
    if @destination.save
      flash[:notice] = "配送先を追加しました"
      redirect_to request.referer
    else
      @customer = current_customer
      @destinations = @customer.destinations
      flash[:notice] = "配送先をすべて入力してください"
      redirect_to destinations_path
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      flash[:notice] = "配送先を変更しました"
      redirect_to destinations_path
    else
      render :edit
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    flash[:notice] = "配送先を削除しました"
    redirect_to request.referer
  end

  private

  def destination_params
    params.require(:destination).permit(:postal_code, :address, :name)
  end

end