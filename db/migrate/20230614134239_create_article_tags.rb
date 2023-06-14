class CreateArticleTags < ActiveRecord::Migration[6.1]
  def change
    create_table :article_tags do |t|
      t.integer :article, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
