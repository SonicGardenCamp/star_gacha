class StaticPagesController < ApplicationController
  def home
    max = params[:max].to_i
    @menu = Menu.new
    valid_items = Item.where("price <= ?", max)
    while (valid_items.any?)
      item = valid_items.sample
        @menu.items.push(item)
      max -=  item.price
      @menu.price += item.price
      @menu.cal += item.cal
      valid_items = Item.where("price <= ?", max)
    end
    if logged_in?
      @menu.users << current_user
      @menu.save
    end
  end

  def toggle_fav
    @menu = Menu.find_by(id: params[:id])
    @menu.update(fav: !@menu.fav)
    render "static_pages/home"
  end
  
  def toggle_fav_record
    @menu = Menu.find_by(id: params[:id])
    @menu.update(fav: !@menu.fav)
    @menus = current_user.menus.paginate(page: params[:page], per_page: 10)
    render "menus/index"
  end

  def help
  end
end
