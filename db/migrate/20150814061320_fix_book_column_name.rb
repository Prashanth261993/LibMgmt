class FixBookColumnName < ActiveRecord::Migration
  def change
  	rename_column :books, :userdb_id, :user_id
  	rename_column :users, :usermail, :user_name
  	rename_column :activities, :userdb_id, :user_id
  end
end
