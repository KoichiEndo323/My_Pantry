class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :is_published, null: false, default: true
      t.timestamps
    end
  end
end
