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

ActiveRecord::Schema.define(version: 2019_05_28_043203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grow_logs", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.float "sunlamp_hrs", null: false
    t.float "water_inches", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plant_age_in_days", null: false
    t.index ["plant_id"], name: "index_grow_logs_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "type", null: false
    t.integer "days_old", default: 0, null: false
    t.integer "total_yield", default: 0, null: false
    t.float "height", default: 0.0, null: false
    t.integer "health_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["session_token"], name: "index_users_on_session_token"
  end

end
