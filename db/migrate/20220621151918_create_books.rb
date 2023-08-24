class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :book
      t.integer :likes_books

      t.timestamps
    end
  end
end
