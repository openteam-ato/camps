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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130606020831) do

  create_table "addresses", :force => true do |t|
    t.integer  "camp_id"
    t.text     "address_line"
    t.string   "district"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "addresses", ["camp_id"], :name => "index_addresses_on_camp_id"

  create_table "camps", :force => true do |t|
    t.string   "title"
    t.string   "kind"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "camp_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phones", ["camp_id"], :name => "index_phones_on_camp_id"

  create_table "shifts", :force => true do |t|
    t.string   "title"
    t.date     "starts_on"
    t.date     "ends_on"
    t.integer  "price"
    t.integer  "age_min"
    t.integer  "age_max"
    t.integer  "camp_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shifts", ["camp_id"], :name => "index_shifts_on_camp_id"

end
