# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_26_045245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string "cohort_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.text "pitch"
    t.text "problem"
    t.text "solution"
    t.text "audience"
    t.text "features"
    t.text "apis"
    t.text "oauth"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cohort_id", null: false
    t.integer "vote_count", default: 0
    t.string "img_url", default: "https://images.unsplash.com/photo-1552862750-746b8f6f7f25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
    t.index ["cohort_id"], name: "index_ideas_on_cohort_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "github_id"
    t.string "token"
    t.string "handle"
    t.bigint "cohort_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_users_on_cohort_id"
  end

  add_foreign_key "ideas", "cohorts"
  add_foreign_key "ideas", "users"
  add_foreign_key "users", "cohorts"
end
