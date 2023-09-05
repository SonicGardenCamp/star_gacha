require 'will_paginate'
require 'will_paginate/active_record'

class MenusController < ApplicationController
  def index
    @menus = current_user.menus.order(created_at: :desc).paginate(page: params[:page], per_page: 8) if logged_in?
  end
  
  def show
    @menu = Menu.find(params[:id]) if params[:id]
  end
  
  def fav_menus
    @menus = nil
    if logged_in?
      fav_menus = current_user.menus.where(fav: true)
      @menus =fav_menus.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
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
      current_user.menus.find_by(fav: false)&.destroy if current_user.menus.count >= 50
      @menu.users << current_user
    end
    @menu.save
    redirect_to menu_path(@menu.id)
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