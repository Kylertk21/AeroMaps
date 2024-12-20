# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_25_112033) do
  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "forum_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pilot_profiles_id"
    t.index ["forum_post_id"], name: "index_comments_on_forum_post_id"
    t.index ["pilot_profiles_id"], name: "index_comments_on_pilot_profiles_id"
  end

  create_table "flight_plans", force: :cascade do |t|
    t.string "departure"
    t.time "time_of_departure"
    t.string "route"
    t.integer "cruising_altitude"
    t.integer "true_airspeed"
    t.string "first_landing"
    t.integer "time_until_first"
    t.integer "fuel_hours"
    t.integer "number_of_passengers"
    t.text "extra_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_posts", force: :cascade do |t|
    t.string "post_topic"
    t.text "post_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pilot_profile_id", null: false
    t.index ["pilot_profile_id"], name: "index_forum_posts_on_pilot_profile_id"
  end

  create_table "pilot_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "aircraft_ident"
    t.string "aircraft_type"
    t.string "home_address"
    t.integer "phone_number"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_pilot_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "forum_posts"
  add_foreign_key "comments", "forum_posts"
  add_foreign_key "comments", "pilot_profiles", column: "pilot_profiles_id"
  add_foreign_key "forum_posts", "pilot_profiles"
end
