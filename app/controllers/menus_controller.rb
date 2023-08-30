require 'will_paginate'
require 'will_paginate/active_record'

class MenusController < ApplicationController
  def index
    @menus = Menu.all.paginate(page: params[:page], per_page: 10)
  end
end