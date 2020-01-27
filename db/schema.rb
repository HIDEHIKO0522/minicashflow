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

ActiveRecord::Schema.define(version: 2020_01_27_062316) do

  create_table "flows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "year_month_day", null: false
    t.integer "income1", default: 0
    t.integer "income2", default: 0
    t.integer "income3", default: 0
    t.integer "income4", default: 0
    t.integer "income5", default: 0
    t.integer "income6", default: 0
    t.integer "income7", default: 0
    t.integer "income_total", null: false
    t.integer "expense1", default: 0
    t.integer "expense2", default: 0
    t.integer "expense3", default: 0
    t.integer "expense4", default: 0
    t.integer "expense5", default: 0
    t.integer "expense6", default: 0
    t.integer "expense7", default: 0
    t.integer "expense8", default: 0
    t.integer "expense_total", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "employee_number", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
