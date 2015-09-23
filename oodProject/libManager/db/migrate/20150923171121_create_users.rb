class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :type
      t.integer :age
      t.boolean :sex
      t.integer :pnum

      t.timestamps null: false
    end
  end
end
