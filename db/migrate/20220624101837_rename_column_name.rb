class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :book, :book_name
    rename_column :users, :password, :password_digest
  end
end
