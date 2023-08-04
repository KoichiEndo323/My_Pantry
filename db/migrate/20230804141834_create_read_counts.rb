class CreateReadCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :read_counts do |t|
      t.integer :end_user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
