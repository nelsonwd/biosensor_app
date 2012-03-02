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

ActiveRecord::Schema.define(:version => 20120228175034) do

  create_table "biosensors", :force => true do |t|
    t.string   "specificity"
    t.string   "specificity_htm"
    t.string   "sensor_name"
    t.string   "sensor_name_htm"
    t.string   "sensor_type"
    t.string   "anal_tech"
    t.string   "iv_props"
    t.string   "organism"
    t.string   "fluorophore"
    t.string   "pub_med_id"
    t.string   "pi_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator"
    t.boolean  "enabled"
  end

end
