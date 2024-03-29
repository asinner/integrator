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

ActiveRecord::Schema.define(version: 20140807214938) do

  create_table "accounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.integer  "event_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["event_id"], name: "index_clients_on_event_id", using: :btree

  create_table "contacts", force: true do |t|
    t.integer  "account_id"
    t.integer  "vendor_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "contacts", ["account_id"], name: "index_contacts_on_account_id", using: :btree
  add_index "contacts", ["event_id"], name: "index_contacts_on_event_id", using: :btree
  add_index "contacts", ["vendor_id"], name: "index_contacts_on_vendor_id", using: :btree

  create_table "event_locations", force: true do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.string   "purpose"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_locations", ["event_id"], name: "index_event_locations_on_event_id", using: :btree
  add_index "event_locations", ["location_id"], name: "index_event_locations_on_location_id", using: :btree

  create_table "event_vendors", force: true do |t|
    t.integer  "event_id"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_vendors", ["event_id"], name: "index_event_vendors_on_event_id", using: :btree
  add_index "event_vendors", ["vendor_id"], name: "index_event_vendors_on_vendor_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "starting_date"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["account_id"], name: "index_events_on_account_id", using: :btree

  create_table "floorplans", force: true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "floorplans", ["event_id"], name: "index_floorplans_on_event_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public"
  end

  create_table "notes", force: true do |t|
    t.string   "notable_type"
    t.integer  "notable_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", force: true do |t|
    t.integer  "floorplan_id"
    t.string   "name"
    t.integer  "length"
    t.integer  "width"
    t.integer  "top"
    t.integer  "left"
    t.integer  "rotation"
    t.string   "style"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tables", ["floorplan_id"], name: "index_tables_on_floorplan_id", using: :btree

  create_table "timeline_categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "timeline_id"
    t.integer  "rank"
  end

  add_index "timeline_categories", ["timeline_id"], name: "index_timeline_categories_on_timeline_id", using: :btree

  create_table "timeline_item_contacts", force: true do |t|
    t.integer  "timeline_item_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timeline_item_contacts", ["contact_id"], name: "index_timeline_item_contacts_on_contact_id", using: :btree
  add_index "timeline_item_contacts", ["timeline_item_id"], name: "index_timeline_item_contacts_on_timeline_item_id", using: :btree

  create_table "timeline_items", force: true do |t|
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timeline_category_id"
    t.integer  "vendor_id"
  end

  add_index "timeline_items", ["timeline_category_id"], name: "index_timeline_items_on_timeline_category_id", using: :btree
  add_index "timeline_items", ["vendor_id"], name: "index_timeline_items_on_vendor_id", using: :btree

  create_table "timelines", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timelines", ["event_id"], name: "index_timelines_on_event_id", using: :btree

  create_table "uploads", force: true do |t|
    t.integer  "account_id"
    t.integer  "event_id"
    t.integer  "size"
    t.string   "s3_filename"
    t.string   "original_filename"
    t.string   "name"
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.boolean  "floorplan"
  end

  add_index "uploads", ["account_id"], name: "index_uploads_on_account_id", using: :btree
  add_index "uploads", ["event_id"], name: "index_uploads_on_event_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "account_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "confirmation_hash"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree

  create_table "vendor_logs", force: true do |t|
    t.integer  "vendor_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendor_logs", ["vendor_id"], name: "index_vendor_logs_on_vendor_id", using: :btree

  create_table "vendors", force: true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "color"
  end

  add_index "vendors", ["account_id"], name: "index_vendors_on_account_id", using: :btree

end
