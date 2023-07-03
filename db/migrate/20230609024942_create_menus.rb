class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.string :title, null: false
      
      t.string :memo, null: false
      t.timestamps
    end
  end
end
