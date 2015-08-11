class CreateUserdbs < ActiveRecord::Migration
  def change
    create_table :userdbs do |t|
      t.string :usermail
      t.string :password
      t.integer :age
      t.string :address
      t.integer :mobile, :limit=>8
      t.integer :usertype, :default=>2
      t.timestamps null: false
    end
      add_index :userdbs, :usermail, :unique => true
  end

end
