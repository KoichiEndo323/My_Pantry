class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.integer :article_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
