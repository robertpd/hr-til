class AddContentConfirmedSafeToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :content_confirmed_safe, :boolean, default: false, null: false
    execute <<-SQL
      UPDATE posts
      SET content_confirmed_safe = true
    SQL
  end

  def down
    remove_column :posts, :content_confirmed_safe
  end
end
