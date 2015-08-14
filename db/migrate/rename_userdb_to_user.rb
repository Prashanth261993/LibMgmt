class RenameUserdbsToUsers < ActiveRecord::Migration
  def change
    rename_table :userdbs, :users
  end
end