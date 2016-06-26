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

ActiveRecord::Schema.define(version: 20160625131923) do

  create_table "books", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.string   "book_title"
    t.string   "book_writer"
    t.string   "book_company"
    t.integer  "book_price"
    t.string   "book_category"
    t.string   "class_name"
    t.string   "teacher"
    t.string   "out_state"
    t.string   "in_state"
    t.string   "saperate"
    t.integer  "sell_price"
    t.string   "message_alert"
    t.string   "image_url",     default: ""
    t.string   "image_thumurl", default: ""
    t.integer  "buyer"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "nickname",               default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "major",                  default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["major"], name: "index_users_on_major"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
