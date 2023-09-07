class Item < ApplicationRecord
  has_many :item_menu_relations, dependent: :delete_all
  has_many :menus, through: :item_menu_relations, dependent: :delete_all
end
