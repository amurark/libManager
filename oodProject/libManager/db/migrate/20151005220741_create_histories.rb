class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :book_isbn
      t.string :user_email
      t.DateTime :checkout_time
      t.DateTime :return_time

      t.timestamps null: false
    end
  end
end
