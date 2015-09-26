class CreateUsers < ActiveRecord::Migration
  # def change
  #   create_table :users, id: false do |t|
  #     t.string :email, null: false
  #     t.string :name
  #     t.integer :ty
  #     t.integer :age
  #     t.boolean :sex
  #     t.integer :pnum
  #
  #     t.timestamps null: false
  #   end
  #   add_index :users, :email, unique: true
  # end

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :pn
      t.integer :ty
      t.integer :age
      t.boolean :sex

      t.timestamps null: false
    end
  end
end
