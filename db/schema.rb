# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150812063429) do

  create_table "activities", force: :cascade do |t|
    t.string   "user_name"
    t.string   "book_name"
    t.boolean  "taken"
    t.integer  "userdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.float    "price"
    t.integer  "userdb_id",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "userdbs", force: :cascade do |t|
    t.string   "usermail"
    t.string   "password"
    t.integer  "age"
    t.string   "address"
    t.integer  "mobile",                 limit: 8
    t.integer  "usertype",                         default: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "userdbs", ["email"], name: "index_userdbs_on_email", unique: true
  add_index "userdbs", ["reset_password_token"], name: "index_userdbs_on_reset_password_token", unique: true
  add_index "userdbs", ["usermail"], name: "index_userdbs_on_usermail", unique: true

end
