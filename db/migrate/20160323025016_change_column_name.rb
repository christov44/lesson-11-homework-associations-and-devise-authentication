class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :article_tags, :ability_id, :tag_id
  end
end
