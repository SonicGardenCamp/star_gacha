# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_30_024417) do
  create_table "item_menu_relations", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "menu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_menu_relations_on_item_id"
    t.index ["menu_id"], name: "index_item_menu_relations_on_menu_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "product_name"
    t.integer "price"
    t.integer "cal"
    t.string "food_or_drink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "menu_ids"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus_items", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_menus_items_on_item_id"
    t.index ["menu_id"], name: "index_menus_items_on_menu_id"
  end

  add_foreign_key "item_menu_relations", "items"
  add_foreign_key "item_menu_relations", "menus"
  add_foreign_key "menus_items", "items"
  add_foreign_key "menus_items", "menus"
end
