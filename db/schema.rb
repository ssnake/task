# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_24_072918) do

  create_table "bearers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_bearers_on_name", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.boolean "is_deleted"
    t.integer "bearer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bearer_id"], name: "index_stocks_on_bearer_id"
    t.index ["is_deleted"], name: "index_stocks_on_is_deleted"
    t.index ["name"], name: "index_stocks_on_name", unique: true
  end

  add_foreign_key "stocks", "bearers"
end
