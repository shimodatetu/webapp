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

ActiveRecord::Schema.define(version: 2019_02_05_124136) do

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
    t.integer "user_id"
    t.integer "group_id"
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
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "gender"
    t.string "fullName"
    t.integer "age"
    t.string "image"
    t.string "profile"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
