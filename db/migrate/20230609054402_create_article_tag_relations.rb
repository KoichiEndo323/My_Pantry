class CreateArticleTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :article_tag_relations do |t|
      t.integer  :article_id, null: false, foreign_key: true
      t.integer :article_tag_id, null: false, foreign_key: true
      #データの検索が多い場合にはreferenceを使用する
      t.timestamps
    end

    # 同じタグを２回保存するのは出来ないようになる
    add_index :article_tag_relations, [:article_id, :article_tag_id], unique: true
  end
end

