class AddCsvIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :csv_id, :integer
    add_column :items, :exist, :boolean, default: true
  end
end
