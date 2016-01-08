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

ActiveRecord::Schema.define(version: 20160108161710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string   "name"
    t.string   "date"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "number"
  end

  add_index "bills", ["teacher_id"], name: "index_bills_on_teacher_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_fields", force: :cascade do |t|
    t.string   "data"
    t.integer  "item_id"
    t.integer  "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_fields", ["field_id"], name: "index_item_fields_on_field_id", using: :btree
  add_index "item_fields", ["item_id"], name: "index_item_fields_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["bill_id"], name: "index_items_on_bill_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "company_status"
    t.string   "siret"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "bills", "teachers"
  add_foreign_key "item_fields", "fields"
  add_foreign_key "item_fields", "items"
  add_foreign_key "items", "bills"
end
