class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: false do |t|
      t.integer :ISBN
      t.string :Title
      t.string :Authors
      t.string :Description
      t.boolean :Status
      t.string :Lastuser
      t.timestamp :Datetime

      t.timestamps null: false

  end
  end
end
