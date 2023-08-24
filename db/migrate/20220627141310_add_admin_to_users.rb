class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
    change_column_null :users, :username, false
    change_column_null :users, :password_digest, false
    change_column_null :books, :book_name, false
  end
end
