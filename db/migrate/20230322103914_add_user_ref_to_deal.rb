class AddUserRefToDeal < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :author_id, :integer
    add_index :deals, :author_id
  end
end
