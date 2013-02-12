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

ActiveRecord::Schema.define(:version => 20130212122225) do

  create_table "admin_details", :force => true do |t|
    t.string "support_phone_no"
    t.string "vendor_phone_no"
    t.string "assigned_admins"
  end

  create_table "cab_requests", :force => true do |t|
    t.string   "contact_no"
    t.string   "destination"
    t.string   "pick_up_time"
    t.text     "comments"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "requester"
    t.string   "pick_up_for"
    t.date     "date"
    t.string   "source"
    t.integer  "no_of_passengers", :limit => 255
  end

end
