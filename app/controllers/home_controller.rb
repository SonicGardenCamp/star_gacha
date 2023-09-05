class HomeController < ApplicationController
  def top
    if params[:id]
      @menu = Menu.find(params[:id])
    else
      @menu = Menu.new
    end
  end
end
