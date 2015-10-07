class DefaultStatusInBooks < ActiveRecord::Migration
  def change
    change_column :books, :Status, :boolean, :null => false, :default => false
  end
end
