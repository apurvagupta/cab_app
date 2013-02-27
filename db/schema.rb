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

ActiveRecord::Schema.define(:version => 20130227074629) do

  create_table "admins", :force => true do |t|
    t.string  "name"
    t.string  "contact_no"
    t.boolean "status",     :default => false
  end

  create_table "cab_requests", :force => true do |t|
    t.string   "contact_no"
    t.string   "destination"
    t.datetime "pick_up_time",     :limit => 255
    t.text     "comments"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "requester"
    t.string   "traveler_name"
    t.date     "pick_up_date"
    t.string   "source"
    t.integer  "no_of_passengers", :limit => 255
  end

  create_table "vendors", :force => true do |t|
    t.string  "name"
    t.string  "contact_no"
    t.boolean "status",     :default => false
  end

end
