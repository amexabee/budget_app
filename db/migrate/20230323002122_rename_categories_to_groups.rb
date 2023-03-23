class RenameCategoriesToGroups < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :groups
  end
end
