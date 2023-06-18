class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :food_id, null: false, foreign_key: true
      t.integer :end_user_id, null: false, foreign_key: true
      t.boolean :is_checked, null: false, default: false
      t.timestamps
    end
  end
end
