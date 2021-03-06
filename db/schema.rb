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

ActiveRecord::Schema.define(version: 2019_04_30_001020) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bigcategories", force: :cascade do |t|
    t.string "name_en"
    t.string "name_jp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "lang"
    t.string "title_en"
    t.string "title_jp"
    t.integer "user_id"
    t.integer "smallcategory_id"
    t.integer "bigcategory_id"
    t.integer "seen_num", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "lang"
    t.text "content_eng"
    t.text "content_jap"
    t.string "image"
    t.integer "id_ingroup"
    t.integer "user_id"
    t.integer "group_id"
    t.binary "photo", limit: 1048576
    t.string "file_name"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secretcategories", force: :cascade do |t|
    t.string "name_en"
    t.string "name_jp"
    t.integer "smallcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallcategories", force: :cascade do |t|
    t.string "name_en"
    t.string "name_jp"
    t.integer "bigcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "gender"
    t.binary "photo", limit: 1048576
    t.string "file_name"
    t.string "profile_en"
    t.string "profile_jp"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "able_see", default: true
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
