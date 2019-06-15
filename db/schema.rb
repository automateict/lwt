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

ActiveRecord::Schema.define(version: 2019_06_04_125845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "complaints", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_unit_id"
    t.string "title"
    t.text "body"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_unit_id"], name: "index_complaints_on_organization_unit_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "cr_committee_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_unit_id"
    t.bigint "cr_committee_id"
    t.string "title"
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.text "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cr_committee_id"], name: "index_cr_committee_members_on_cr_committee_id"
    t.index ["organization_unit_id"], name: "index_cr_committee_members_on_organization_unit_id"
    t.index ["user_id"], name: "index_cr_committee_members_on_user_id"
  end

  create_table "cr_committees", force: :cascade do |t|
    t.bigint "organization_unit_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_unit_id"], name: "index_cr_committees_on_organization_unit_id"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "organization_unit_id"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_unit_id"], name: "index_departments_on_organization_unit_id"
  end

  create_table "government_bodies", force: :cascade do |t|
    t.bigint "government_body_type_id"
    t.string "name"
    t.integer "parent_government_body_id"
    t.string "city"
    t.string "url"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["government_body_type_id"], name: "index_government_bodies_on_government_body_type_id"
  end

  create_table "government_body_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_units", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "code"
    t.bigint "organization_type_id"
    t.integer "parent_organization_unit_id"
    t.string "url"
    t.string "contact_person"
    t.string "contact_phone"
    t.string "contact_email"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_type_id"], name: "index_organization_units_on_organization_type_id"
  end

  create_table "petitions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "government_body_id"
    t.bigint "sector_id"
    t.string "title"
    t.text "petition_details"
    t.integer "target_of_signatures"
    t.boolean "need_for_email_notification"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["government_body_id"], name: "index_petitions_on_government_body_id"
    t.index ["sector_id"], name: "index_petitions_on_sector_id"
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "pr_commitee_members", force: :cascade do |t|
    t.bigint "pr_committee_id"
    t.bigint "organization_unit_id"
    t.string "name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_unit_id"], name: "index_pr_commitee_members_on_organization_unit_id"
    t.index ["pr_committee_id"], name: "index_pr_commitee_members_on_pr_committee_id"
  end

  create_table "pr_committees", force: :cascade do |t|
    t.bigint "petition_id"
    t.string "name"
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petition_id"], name: "index_pr_committees_on_petition_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "petition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petition_id"], name: "index_signatures_on_petition_id"
    t.index ["user_id"], name: "index_signatures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role_id"
    t.string "first_name"
    t.string "father_name"
    t.string "grand_father_name"
    t.bigint "government_body_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["government_body_id"], name: "index_users_on_government_body_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "complaints", "organization_units"
  add_foreign_key "complaints", "users"
  add_foreign_key "cr_committee_members", "cr_committees"
  add_foreign_key "cr_committee_members", "organization_units"
  add_foreign_key "cr_committee_members", "users"
  add_foreign_key "cr_committees", "organization_units"
  add_foreign_key "departments", "organization_units"
  add_foreign_key "government_bodies", "government_body_types"
  add_foreign_key "organization_units", "organization_types"
  add_foreign_key "petitions", "government_bodies"
  add_foreign_key "petitions", "sectors"
  add_foreign_key "petitions", "users"
  add_foreign_key "pr_commitee_members", "organization_units"
  add_foreign_key "pr_commitee_members", "pr_committees"
  add_foreign_key "pr_committees", "petitions"
  add_foreign_key "signatures", "petitions"
  add_foreign_key "signatures", "users"
  add_foreign_key "users", "government_bodies"
end
