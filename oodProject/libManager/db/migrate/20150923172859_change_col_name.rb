class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :users, :type, :ty
  end
end
