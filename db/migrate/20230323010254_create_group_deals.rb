class CreateGroupDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :group_deals do |t|
      t.references :group, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
