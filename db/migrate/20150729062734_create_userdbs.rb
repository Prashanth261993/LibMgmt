class CreateUserdbs < ActiveRecord::Migration
  def change
    create_table :userdbs do |t|
      t.string :usermail
      t.string :password
      t.integer :age
      t.string :address
      t.integer :mobile
      t.integer :usertype
      t.timestamps null: false
    end
  end
end
