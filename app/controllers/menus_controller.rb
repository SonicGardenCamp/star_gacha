require 'will_paginate'
require 'will_paginate/active_record'

class MenusController < ApplicationController
  def index
    @menus = nil
    if logged_in?
      @menus = current_user.menus.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  end
  
  def fav_menus
    @menus = nil
    if logged_in?
      fav_menus = current_user.menus.where(fav: true)
      @menus =fav_menus.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  end
  
  def toggle_fav
    @menu = Menu.find(params[:id])
    @menu.update(fav: !@menu.fav)
    redirect_to request.referer
  end
  
  def spin_gacha
    @menu = spin(params[:max].to_i)
    if logged_in?
      @menu.users << current_user
    end
      @menu.save
    redirect_to controller: 'static_pages', action: 'home', id: @menu.id
  end

  private

    def spin(max)
      menu = Menu.new
      valid_items = Item.where("price <= ?", max)
      while (valid_items.any?)
        item = valid_items.sample
          menu.items.push(item)
        max -=  item.price
        menu.price += item.price
        menu.cal += item.cal
        valid_items = Item.where("price <= ?", max)
      end
      return menu
    end
end