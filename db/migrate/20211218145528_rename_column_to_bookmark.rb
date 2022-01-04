class RenameColumnToBookmark < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookmarks, :comments, :comment
  end
end
