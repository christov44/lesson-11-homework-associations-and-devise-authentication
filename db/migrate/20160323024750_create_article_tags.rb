class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.integer :article_id
      t.integer :ability_id

      t.timestamps null: false
    end
  end
end
