class Menu < ApplicationRecord
  has_many :item_menu_relations
  has_many :items, through: :item_menu_relations
end
