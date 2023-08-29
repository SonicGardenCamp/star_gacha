class GachaController < ApplicationController
  # def spin
    # max = params[:hidden_data].to_i
    # items = Item.where("price <= ?", max)
    # result_last = []
    # @result = []
    # while (items.any?)
    #   if @result == nil
    #     @result = items.shuffle[0]
    #   else
    #     @result.push(items.shuffle[0])
    #   end
    #   result_last = @result.last
    #   max -=  result_last["price"]
    #   items = Item.where("price <= ?", max)
    # end
    # redirect_to "/help"
      # redirect_to "/spin"
  # end  
end
