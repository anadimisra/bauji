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

ActiveRecord::Schema.define(version: 20170708125356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.text "description", default: "", null: false
    t.text "terms", null: false
    t.string "seo_meta_keywords", null: false, array: true
    t.string "seo_meta_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code", limit: 8, null: false
    t.decimal "percentage", precision: 5, scale: 4, null: false
    t.decimal "max_value", precision: 6, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_coupons_on_code", unique: true
    t.index ["max_value"], name: "index_coupons_on_max_value"
    t.index ["percentage"], name: "index_coupons_on_percentage"
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "number", default: 5, null: false
    t.date "valid_till", null: false
    t.boolean "active", default: false, null: false
    t.bigint "workshop_id"
    t.bigint "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_discounts_on_active"
    t.index ["coupon_id"], name: "index_discounts_on_coupon_id"
    t.index ["number"], name: "index_discounts_on_number"
    t.index ["valid_till"], name: "index_discounts_on_valid_till"
    t.index ["workshop_id"], name: "index_discounts_on_workshop_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.string "location", limit: 100, default: "", null: false
    t.int4range "experience", null: false
    t.text "description", null: false
    t.text "skills", null: false
    t.boolean "active", default: false, null: false
    t.string "seo_meta_keywords", null: false
    t.string "seo_meta_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_job_posts_on_active"
    t.index ["location"], name: "index_job_posts_on_location"
    t.index ["name"], name: "index_job_posts_on_name", unique: true
  end

  create_table "learners", force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "first_name", limit: 30, null: false
    t.string "middle_name", limit: 30
    t.string "last_name", null: false
    t.string "mobile", limit: 10, null: false
    t.string "country_code", limit: 3, null: false
    t.string "company", limit: 50, null: false
    t.string "job_role", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company"], name: "index_learners_on_company"
    t.index ["country_code"], name: "index_learners_on_country_code"
    t.index ["email"], name: "index_learners_on_email", unique: true
    t.index ["first_name"], name: "index_learners_on_first_name"
    t.index ["last_name"], name: "index_learners_on_last_name"
    t.index ["middle_name"], name: "index_learners_on_middle_name"
    t.index ["mobile"], name: "index_learners_on_mobile"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "registration_id"
    t.string "payment_gateway"
    t.string "payment_gateway_transaction_id"
    t.decimal "offer_price"
    t.decimal "sale_price"
    t.string "status"
    t.bigint "workshop_id"
    t.bigint "learner_id"
    t.bigint "discount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_tickets_on_discount_id"
    t.index ["learner_id"], name: "index_tickets_on_learner_id"
    t.index ["registration_id"], name: "index_tickets_on_registration_id", unique: true
    t.index ["status"], name: "index_tickets_on_status"
    t.index ["workshop_id"], name: "index_tickets_on_workshop_id"
  end

  create_table "transaction_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_transaction_statuses_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "workshops", force: :cascade do |t|
    t.string "venue", limit: 50, default: ""
    t.string "city", limit: 50, default: "", null: false
    t.string "country", limit: 30, default: "", null: false
    t.string "venue_map_link"
    t.text "description"
    t.date "starts_on", null: false
    t.date "ends_on", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.integer "seats", default: 25, null: false
    t.decimal "ticket_price", precision: 9, scale: 2, default: "41200.0", null: false
    t.string "seo_meta_keywords", null: false, array: true
    t.string "seo_meta_description", null: false
    t.bigint "certification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_workshops_on_certification_id"
    t.index ["city"], name: "index_workshops_on_city"
    t.index ["country"], name: "index_workshops_on_country"
    t.index ["ends_on"], name: "index_workshops_on_ends_on"
    t.index ["starts_on"], name: "index_workshops_on_starts_on"
    t.index ["ticket_price"], name: "index_workshops_on_ticket_price"
  end

  add_foreign_key "discounts", "coupons"
  add_foreign_key "discounts", "workshops"
  add_foreign_key "tickets", "discounts"
  add_foreign_key "tickets", "learners"
  add_foreign_key "tickets", "workshops"
  add_foreign_key "workshops", "certifications"
end
