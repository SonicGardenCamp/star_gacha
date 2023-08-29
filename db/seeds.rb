# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Item.create!( product_name: "コーヒー フラペチーノ short",
              price: 475,
              cal: 170,
              food_or_drink: "drink")
              
Item.create!( product_name: "コールドブリュー コーヒー short",
              price: 400,
              cal: 9,
              food_or_drink: "drink")
              
Item.create!( product_name: "スターバックス ラテ short",
              price: 449,
              cal: 148,
              food_or_drink: "drink")