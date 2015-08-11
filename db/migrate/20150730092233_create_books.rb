class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
    	t.string :author
    	t.float :price 
    	t.integer :userdb_id, :default=>0
      	t.timestamps null: false
    end
  end
end
