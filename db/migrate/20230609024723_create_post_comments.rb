class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :article_id, null: false, foreign_key: true
      t.integer :end_user_id, null: false, foreign_key: true
      t.string :comment, null: false
      t.timestamps
    end
  end
end
