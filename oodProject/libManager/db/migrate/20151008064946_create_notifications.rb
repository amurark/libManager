class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :ISBN
      t.string :email

      t.timestamps null: false
    end
  end
end
