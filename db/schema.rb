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

ActiveRecord::Schema.define(version: 2018_11_05_144431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "difficulty"
  end

  create_table "diplomas_schools", id: false, force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "diploma_id", null: false
  end

  create_table "diplomas_studies", id: false, force: :cascade do |t|
    t.bigint "study_id", null: false
    t.bigint "diploma_id", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "url"
    t.index ["category_id"], name: "index_jobs_on_category_id"
  end

  create_table "jobs_keywords", id: false, force: :cascade do |t|
    t.bigint "keyword_id", null: false
    t.bigint "job_id", null: false
  end

  create_table "jobs_studies", id: false, force: :cascade do |t|
    t.bigint "study_id", null: false
    t.bigint "job_id", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string "name"
    t.string "school"
    t.string "linkedin_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id"
    t.index ["job_id"], name: "index_professionals_on_job_id"
  end

  create_table "profile_saved_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.bigint "study_id"
    t.bigint "diploma_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diploma_id"], name: "index_profile_saved_infos_on_diploma_id"
    t.index ["job_id"], name: "index_profile_saved_infos_on_job_id"
    t.index ["school_id"], name: "index_profile_saved_infos_on_school_id"
    t.index ["study_id"], name: "index_profile_saved_infos_on_study_id"
    t.index ["user_id"], name: "index_profile_saved_infos_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.integer "difficulty"
    t.string "url"
    t.integer "cost"
    t.string "web_site"
  end

  create_table "studies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "length"
    t.integer "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "professionals", "jobs"
  add_foreign_key "profile_saved_infos", "diplomas"
  add_foreign_key "profile_saved_infos", "jobs"
  add_foreign_key "profile_saved_infos", "schools"
  add_foreign_key "profile_saved_infos", "studies"
  add_foreign_key "profile_saved_infos", "users"
end
