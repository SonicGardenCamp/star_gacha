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
    @menu = spin(params[:max].to_i, params[:menu_type])
    if logged_in?
      if current_user.menus.count >= 50
        menu_to_delete = current_user.menus.find_by(fav: false)
        menu_to_delete&.destroy
      end
      @menu.users << current_user
    end
    @menu.save
    redirect_to controller: 'static_pages', action: 'home', id: @menu.id
  end

  private

    def spin(max, menu_type)
      menu = Menu.new
      menu_type_array = menu_type.split
      drink_or_food = menu_type_array.first
      while item = random_item(max, drink_or_food)
        menu.items.push(item)
        max -=  item.price
        menu.price += item.price
        menu.cal += item.cal
        drink_or_food = menu_type_array.last
      end
      return menu
    end
    
    # フードかドリンクか指定してランダムにitemを一つ取得する
    def random_item(max, drink_or_food)
      valid_items = Item.where("price <= ? AND food_or_drink = ?", max, drink_or_food)
      return valid_items.any? ? valid_items.sample : nil
    end
    
end