class ItemMenuRelation < ApplicationRecord
  belongs_to :item, dependent: :delete
  belongs_to :menu, dependent: :delete
end
