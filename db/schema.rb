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

ActiveRecord::Schema.define(version: 20190619212703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "categories_quests", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "quest_id"
    t.index ["category_id"], name: "index_categories_quests_on_category_id"
    t.index ["quest_id"], name: "index_categories_quests_on_quest_id"
  end

  create_table "gears", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_purchased"
    t.bigint "user_id"
    t.bigint "category_id"
    t.boolean "checked_out", default: false
    t.integer "checked_out_to"
    t.index ["category_id"], name: "index_gears_on_category_id"
    t.index ["user_id"], name: "index_gears_on_user_id"
  end

  create_table "gears_quests", id: false, force: :cascade do |t|
    t.integer "gear_id"
    t.integer "quest_id"
    t.index ["gear_id"], name: "index_gears_quests_on_gear_id"
    t.index ["quest_id"], name: "index_gears_quests_on_quest_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "location"
    t.bigint "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["user_id"], name: "index_quests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gears", "categories"
  add_foreign_key "gears", "users"
  add_foreign_key "quests", "users"
end
