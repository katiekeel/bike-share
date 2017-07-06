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

ActiveRecord::Schema.define(version: 15) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_dates", id: :serial, force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bikes", id: :serial, force: :cascade do |t|
    t.integer "bike"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", id: :serial, force: :cascade do |t|
    t.integer "date_id"
    t.integer "max_temp"
    t.integer "mean_temp"
    t.integer "min_temp"
    t.integer "mean_humidity"
    t.integer "mean_visibility"
    t.integer "mean_wind_speed"
    t.integer "precipitation"
  end

  create_table "stations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "dock_count"
    t.integer "city_id"
    t.string "installation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "station_id"
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.string "subscription_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", id: :serial, force: :cascade do |t|
    t.integer "duration"
    t.integer "start_date"
    t.integer "start_station"
    t.integer "end_date"
    t.integer "end_station"
    t.integer "bike_id"
    t.integer "subscription_type"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zip_codes", id: :serial, force: :cascade do |t|
    t.bigint "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
