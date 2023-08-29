class GachaController < ApplicationController
  def spin
    max = params[:max].to_i
    result_last = []
    @result = []
    items = Item.where("price <= ?", max)
    while (items.any?)
        @result.push(items.shuffle[0])
      result_last = @result.last
      max -=  result_last["price"]
      items = Item.where("price <= ?", max)
    end
  end
end
