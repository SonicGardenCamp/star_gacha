class Menu < ApplicationRecord
  has_many :item_menu_relations
  has_many :items, through: :item_menu_relations
  has_many :user_menu_relations
  has_many :users, through: :user_menu_relations, validate: false
  validates :items, presence: true
end
