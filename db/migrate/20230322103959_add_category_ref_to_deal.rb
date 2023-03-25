class AddCategoryRefToDeal < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :category_id, :integer
    add_index :deals, :category_id
  end
end
