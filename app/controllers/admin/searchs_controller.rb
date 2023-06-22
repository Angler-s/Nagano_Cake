class Admin::SearchsController < ApplicationController
  # def index


# Itemのみ検索の場合
    # def index

    #   @q = Item.ransack(params[:q])
    #   @items = @q.result(distinct: true)
      
    # end
    
    def index
      @q = params[:q]
      @items = Item.ransack(name_cont: @q).result
      @customers = Customer.ransack(last_name_cont: @q).result

    end
    

end
