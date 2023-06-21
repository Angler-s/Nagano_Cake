class Admin::SearchsController < ApplicationController
  def index

    def index
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true).page(params[:page]).oder(created_at desc)
    end
  end
end
