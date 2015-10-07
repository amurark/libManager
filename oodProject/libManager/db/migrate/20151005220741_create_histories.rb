class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :book_isbn
      t.string :user_email
      t.string :book_title
      t.string :book_author
      t.timestamp :checkout_time
      t.timestamp :return_time

      t.timestamps null: false
    end
  end
end
