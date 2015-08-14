class ChangeUserdbsToUsers < ActiveRecord::Migration
  def change
	 rename_table :userdbs, :users
  end
end
