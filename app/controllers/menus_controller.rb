class MenusController < ApplicationController
  def index
    @menus = []
    all_menu = Menu.all
    all_menu.each do |menu|
      @menus << menu.items
    end
    
  end
end
