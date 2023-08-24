class ChangeColumnNameToBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :likes_books, :likes
  end
end
