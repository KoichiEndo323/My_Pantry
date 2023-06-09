class CreateArticleTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :article_tag_relations do |t|
      t.integer :article_id, null: false, foreign_key: true
      t.integer :article_tag_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
