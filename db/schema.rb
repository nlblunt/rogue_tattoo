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

ActiveRecord::Schema.define(version: 20140903161911) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "artists", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "picture",             limit: 255
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "facebook",            limit: 255
    t.string   "instagram",           limit: 255
  end

  create_table "clients", force: :cascade do |t|
    t.string   "lastname",   limit: 255
    t.string   "firstname",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.boolean  "display"
    t.integer  "story_id"
    t.integer  "artist_id"
    t.string   "img_file_name",    limit: 255
    t.string   "img_content_type", limit: 255
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["artist_id"], name: "index_images_on_artist_id"
  add_index "images", ["story_id"], name: "index_images_on_story_id"

  create_table "makeupartists", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "picture",             limit: 255
    t.text     "bio"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook",            limit: 255
    t.string   "instagram",           limit: 255
  end

  create_table "makeupimages", force: :cascade do |t|
    t.integer  "makeupartist_id"
    t.string   "img_file_name",    limit: 255
    t.string   "img_content_type", limit: 255
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "makeupimages", ["makeupartist_id"], name: "index_makeupimages_on_makeupartist_id"

  create_table "newsposts", force: :cascade do |t|
    t.text     "heading"
    t.text     "body"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.date     "date"
    t.boolean  "featured"
    t.integer  "artist_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["artist_id"], name: "index_stories_on_artist_id"
  add_index "stories", ["client_id"], name: "index_stories_on_client_id"

end
