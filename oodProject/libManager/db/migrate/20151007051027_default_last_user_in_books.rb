class DefaultLastUserInBooks < ActiveRecord::Migration
  def change
    change_column :books, :Lastuser, :string, :default => nil
  end
end
