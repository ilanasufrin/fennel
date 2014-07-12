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

ActiveRecord::Schema.define(version: 20140712014819) do

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
  end

  add_index "items", ["location"], name: "index_items_on_location"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "offers", force: true do |t|
    t.integer  "item_id",      null: false
    t.integer  "owner_id",     null: false
    t.integer  "recipient_id", null: false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["owner_id"], name: "index_offers_on_owner_id"
  add_index "offers", ["recipient_id"], name: "index_offers_on_recipient_id"

  create_table "users", force: true do |t|
    t.string   "email",        null: false
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["location"], name: "index_users_on_location"
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

end
