class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    # 注文履歴一覧　1ページ当たりの表示数は10
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
  end

end
