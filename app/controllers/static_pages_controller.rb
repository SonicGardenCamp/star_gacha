class StaticPagesController < ApplicationController
  def home
    max = params[:max].to_i
    result_last = []
    @result = []
    @sum_price = 0
    @sum_cal = 0
    items = Item.where("price <= ?", max)
    while (items.any?)
        @result.push(items.sample)
      result_last = @result.last
      max -=  result_last["price"]
      @sum_price += result_last.price
      @sum_cal += result_last.cal
      items = Item.where("price <= ?", max)
    end
    menu = Menu.new
    menu.items = @result
    menu.save
  end

  def help
  end
  
end
