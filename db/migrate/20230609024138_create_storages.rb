class CreateStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :storages do |t|
      t.integer :food_id, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
