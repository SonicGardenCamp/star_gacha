require "csv"

class DocumentsController < ApplicationController
  before_action :perform_checks
  
  def new
  end

  def create
    upload_file = params[:upload_file]
    category  = upload_file.original_filename.gsub(/s.csv$/, '')
    if category == "food" || category == "drink"
      CSV.foreach(upload_file.path, headers: false) do |row|
        product_name, cal, price, topping1, topping2, topping3, csv_id, exist = row[0], row[1].to_i, row[2].to_i, row[3], row[4], row[5], row[6].to_i, row[7]
        item = Item.find_by(food_or_drink: category, csv_id: csv_id)
        if exist == "1"
          exist = true
        else
          exist = false
        end
        if item
          item.update(product_name: product_name, cal: cal, price: price, topping1: topping1, topping2: topping2, topping3: topping3, exist: exist)
        else
          Item.create(product_name: product_name, cal: cal, price: price, topping1: topping1, topping2: topping2, topping3: topping3, food_or_drink: category, csv_id: csv_id, exist: exist)
        end
      end
    end
  end
    
  private
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
