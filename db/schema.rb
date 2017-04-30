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

ActiveRecord::Schema.define(version: 20170430052646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.integer  "postcode"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_comments_on_project_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "country"
    t.date     "date"
    t.string   "image_url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_faqs_on_project_id", using: :btree
  end

  create_table "funding_transactions", force: :cascade do |t|
    t.string   "charge_id"
    t.integer  "amount"
    t.string   "currency"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_funding_transactions_on_project_id", using: :btree
    t.index ["user_id"], name: "index_funding_transactions_on_user_id", using: :btree
  end

  create_table "future_donors", force: :cascade do |t|
    t.string   "customer_id"
    t.integer  "amount"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_future_donors_on_project_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_links_on_project_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "subject"
    t.string   "description"
    t.boolean  "read_status", default: false
    t.datetime "read_at"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "document_type"
    t.string   "document_url"
    t.string   "full_name"
    t.string   "nationality"
    t.date     "birth_date"
    t.string   "profile_image_url"
    t.string   "bio"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "project_backers", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_backers_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_backers_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "aasm_state"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "image_url"
    t.string   "video_url"
    t.integer  "pledged_amount"
    t.integer  "funded_amount",  default: 0
    t.integer  "total_backers",  default: 0
    t.string   "funding_model"
    t.datetime "start_date"
    t.integer  "duration"
    t.boolean  "approved",       default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["category_id"], name: "index_projects_on_category_id", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.integer  "amount"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_rewards_on_project_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "heading"
    t.text     "description"
    t.string   "image_url"
    t.integer  "story_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["story_id"], name: "index_sections_on_story_id", using: :btree
  end

  create_table "social_auths", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_auths_on_user_id", using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_stories_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.string   "password_digest"
    t.boolean  "email_confirmed",     default: false
    t.string   "confirm_token"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "secondary_email"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "instagram_url"
    t.string   "google_plus_url"
    t.string   "phone_no"
    t.integer  "total_backed_amount", default: 0
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
end
