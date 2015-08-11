class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :user_name
      t.string :book_name
      t.boolean :taken
      t.integer :userdb_id
      t.timestamps null: false
    end
  end
end
