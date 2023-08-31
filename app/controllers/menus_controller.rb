require 'will_paginate'
require 'will_paginate/active_record'

class MenusController < ApplicationController
  def index
    @menus = nil
    if logged_in?
      @menus = current_user.menus.paginate(page: params[:page], per_page: 10)
    end
  end
end