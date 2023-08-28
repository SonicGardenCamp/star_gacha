class GachaController < ApplicationController
  def spin
    max = params[:hidden_data].to_i
    items = Item.where("price <= ?", max)
    while (items.any?)
      if @result == nil
        @result = items.shuffle[0]
      else
        @result.push(items.shuffle[0])
      end
      max -= @result.last["price"].to_i
      items = Item.where("price <= ?", max)
    end
    debugger 
  end  
end
