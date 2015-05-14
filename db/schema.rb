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

ActiveRecord::Schema.define(version: 20150513091704) do

  create_table "ask_alives", force: :cascade do |t|
    t.integer  "contact_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "token",      limit: 255
    t.string   "status",     limit: 255, default: "pending", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",                     limit: 255,                null: false
    t.string   "phone",                    limit: 255,                null: false
    t.string   "home_phone",               limit: 255
    t.string   "email",                    limit: 255,                null: false
    t.string   "address",                  limit: 255
    t.integer  "user_id",                  limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "relationship",             limit: 255
    t.string   "relationship_color_class", limit: 255
    t.boolean  "check_alive",              limit: 1,   default: true
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",            limit: 4,                       null: false
    t.text     "content",            limit: 65535
    t.date     "delivery_date"
    t.string   "status",             limit: 255,   default: "final", null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "audio_file_name",    limit: 255
    t.string   "audio_content_type", limit: 255
    t.integer  "audio_file_size",    limit: 4
    t.datetime "audio_updated_at"
    t.string   "video_file_name",    limit: 255
    t.string   "video_content_type", limit: 255
    t.integer  "video_file_size",    limit: 4
    t.datetime "video_updated_at"
  end

  create_table "receivers", force: :cascade do |t|
    t.integer  "message_id", limit: 4, null: false
    t.integer  "contact_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "receivers", ["contact_id"], name: "index_receivers_on_contact_id", using: :btree
  add_index "receivers", ["message_id"], name: "index_receivers_on_message_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",     null: false
    t.string   "encrypted_password",     limit: 255,   default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.string   "home_phone",             limit: 255
    t.string   "address",                limit: 255
    t.date     "active_date"
    t.string   "status",                 limit: 255,   default: "live", null: false
    t.text     "fb_token",               limit: 65535
    t.datetime "fb_expires_at"
    t.string   "phone",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
