class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :quantity, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :memo, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
