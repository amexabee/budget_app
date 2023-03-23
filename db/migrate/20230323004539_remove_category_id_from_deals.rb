class RemoveCategoryIdFromDeals < ActiveRecord::Migration[7.0]
  def change
    remove_index :deals, :category_id
    remove_column :deals, :category_id
  end
end
