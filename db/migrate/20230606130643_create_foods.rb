class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.integer :end_user_id, foreign_key: true, null: false
      t.integer :storage_id, foreign_key: true, null: false
      t.string :name, null: false
      t.string :quantity, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :memo
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
