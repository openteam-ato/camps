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

ActiveRecord::Schema.define(:version => 20130619093037) do

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

  create_table "employees", :force => true do |t|
    t.integer  "camp_id"
    t.string   "full_name"
    t.string   "post"
    t.string   "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "employees", ["camp_id"], :name => "index_employees_on_camp_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.text     "url"
    t.integer  "camp_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["camp_id"], :name => "index_links_on_camp_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "camp_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phones", ["camp_id"], :name => "index_phones_on_camp_id"

  create_table "photos", :force => true do |t|
    t.integer  "camp_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "image_url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "photos", ["camp_id"], :name => "index_photos_on_camp_id"

  create_table "registers", :force => true do |t|
    t.string   "title"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.text     "attachment_url"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "title"
    t.date     "starts_on"
    t.date     "ends_on"
    t.integer  "price_min"
    t.integer  "age_min"
    t.integer  "age_max"
    t.integer  "camp_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "price_max"
  end

  add_index "seasons", ["camp_id"], :name => "index_shifts_on_camp_id"

end
