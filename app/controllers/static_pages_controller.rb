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
    if logged_in?
      menu = Menu.new
      menu.items = @result
      menu.users << current_user
      menu.save
      @menu_id = menu.id
    end
  end

  def help
  end
  
  def toggle_fav
    @menu = Menu.find(params[:id])
    @menu.update(fav: !@menu.fav)
  end
  
end
