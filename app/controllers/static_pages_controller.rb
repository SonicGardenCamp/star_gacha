class StaticPagesController < ApplicationController
  def home
    if params[:id]
      @menu = Menu.find(params[:id])
    else
      @menu = Menu.new
    end
  end

  def help
  end
  
  
end
