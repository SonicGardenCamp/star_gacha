require "csv"

class DocumentsController < ApplicationController
  before_action :perform_checks
  
  def new
  end

  def create
    upload_file = params[:upload_file]
    category  = upload_file.original_filename.gsub(/s.csv$/, '')
    destroy_items(category)
    if category == "topping"
      CSV.foreach(csv_path, headers: false) do |row|
        product_name, price = row[0], row[1].to_i
        Topping.create!(
          product_name: product_name,
          price: price,
        )
      end
    elsif category == "food" || category == "drink"
      CSV.foreach(upload_file.path, headers: false) do |row|
        product_name, cal, price, topping1, topping2, topping3 = row[0], row[1].to_i, row[2].to_i, row[3], row[4], row[5]
        Item.create!(
          product_name: product_name,
          cal: cal,
          price: price,
          food_or_drink: "drink",
          topping1: topping1,  
          topping2: topping2,  
          topping3: topping3,  
        )
      end
    end
  end
  
  private
    def destroy_items(category)
      Item.where("food_or_drink == ?", category).destroy_all
      Topping.destroy_all if category == "topping"
    end
    
    def perform_checks
      if !logged_in?
        redirect_to login_path
        return
      end
      if !current_user.admin?
        redirect_to menus_path
      end
    end
end
