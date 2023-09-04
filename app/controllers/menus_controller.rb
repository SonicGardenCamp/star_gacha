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
    @menu = spin(params[:max].to_i, params[:drink])
    if logged_in?
      @menu.users << current_user
    end
    @menu.save
    redirect_to controller: 'static_pages', action: 'home', id: @menu.id
  end
  
  def spin_gacha_drink_food
    @menu = spin_drink_food(params[:max].to_i)
    if logged_in?
      @menu.users << current_user
    end
    @menu.save
    redirect_to controller: 'static_pages', action: 'home', id: @menu.id
  end

  private

# drinkは"drink" or nil
    def spin(max, drink)
      menu = Menu.new
      while item = random_item(max, drink)
        menu.items.push(item)
        max -=  item.price
        menu.price += item.price
        menu.cal += item.cal
      end
      return menu
    end
    
    # 一つ目はドリンク２つ目以降はフードのメニューを作る
    def spin_drink_food(max)
      menu = Menu.new
      if item = random_item(max, "drink")
        menu.items.push(item)
        max -=  item.price
        menu.price += item.price
        menu.cal += item.cal
      end
      while item = random_item(max, "food")
        menu.items.push(item)
        max -=  item.price
        menu.price += item.price
        menu.cal += item.cal
      end
      return menu
    end
    
    # フードかドリンクか指定してランダムにitemを一つ取得する
    def random_item(max, food_or_drink)
      if food_or_drink
        valid_items = Item.where("price <= ? AND food_or_drink = ?", max, food_or_drink)
      else
        valid_items = Item.where("price <= ?", max)
      end
      return valid_items.any? ? valid_items.sample : nil
    end
    
end