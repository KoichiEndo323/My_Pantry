class CreateArtcleTags < ActiveRecord::Migration[6.1]
  def change
    create_table :artcle_tags do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
