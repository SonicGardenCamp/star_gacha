# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

# CSVファイルのパスを指定して読み込む
csv_path = 'db/menu_prices.csv'

# CSVファイルの各行を読み込んでデータベースに登録する
CSV.foreach(csv_path, headers: false) do |row|
  product_name, cal, price = row[0], row[1].to_i, row[2].to_i

  Item.create!(
    product_name: product_name,
    price: price,
    cal: cal,
    food_or_drink: "drink"
  )
end

csv_path = 'db/menu_food.csv'

CSV.foreach(csv_path, headers: false) do |row|
  product_name, cal, price = row[0], row[1].to_i, row[2].to_i

  Item.create!(
    product_name: product_name,
    price: price,
    cal: cal,
    food_or_drink: "food"
  )
end