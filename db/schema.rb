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

ActiveRecord::Schema.define(version: 20140712175017) do

  create_table "items", force: true do |t|
    t.string   "location"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "status",             default: 0
  end

  add_index "items", ["latitude", "longitude"], name: "index_items_on_latitude_and_longitude"
  add_index "items", ["status"], name: "index_items_on_status"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "offers", force: true do |t|
    t.integer  "item_id",                              null: false
    t.integer  "owner_id",                             null: false
    t.integer  "recipient_id",                         null: false
    t.integer  "status",       limit: 255, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["owner_id"], name: "index_offers_on_owner_id"
  add_index "offers", ["recipient_id"], name: "index_offers_on_recipient_id"
  add_index "offers", ["status"], name: "index_offers_on_status"

  create_table "users", force: true do |t|
    t.string   "email",         null: false
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "phone_number"
    t.string   "session_token"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

  add_index "users", ["latitude", "longitude"], name: "index_users_on_latitude_and_longitude"
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  add_index "users", ["session_token"], name: "index_users_on_session_token"

end
