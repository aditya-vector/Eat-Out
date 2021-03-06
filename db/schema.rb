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

ActiveRecord::Schema.define(version: 20180415133357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_guests_on_email", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "work_shift_id", null: false
    t.time "arrival_at", null: false
    t.bigint "guest_id", null: false
    t.integer "guest_count", null: false
    t.bigint "seating_table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["seating_table_id"], name: "index_reservations_on_seating_table_id"
    t.index ["work_shift_id"], name: "index_reservations_on_work_shift_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.bigint "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seating_tables", force: :cascade do |t|
    t.string "name", null: false
    t.integer "min_seating", null: false
    t.integer "max_seating", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_seating_tables_on_restaurant_id"
  end

  create_table "work_shifts", force: :cascade do |t|
    t.time "starts_at", null: false
    t.time "ends_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "guests"
  add_foreign_key "reservations", "seating_tables"
  add_foreign_key "reservations", "work_shifts"
  add_foreign_key "seating_tables", "restaurants"
end
