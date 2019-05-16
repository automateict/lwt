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

ActiveRecord::Schema.define(version: 20190516080623) do

  create_table "facilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "facility_type_id"
    t.string "code"
    t.bigint "organization_unit_id"
    t.string "ownership"
    t.string "contact_person"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "url"
    t.integer "latitude"
    t.integer "longitude"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_type_id"], name: "index_facilities_on_facility_type_id"
    t.index ["organization_unit_id"], name: "index_facilities_on_organization_unit_id"
  end

  create_table "facility_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "government_bodies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "government_body_type_id"
    t.string "name"
    t.bigint "region_id"
    t.string "city"
    t.string "url"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["government_body_type_id"], name: "index_government_bodies_on_government_body_type_id"
    t.index ["region_id"], name: "index_government_bodies_on_region_id"
  end

  create_table "government_body_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institution_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "institution_type_id"
    t.string "address"
    t.string "url"
    t.string "contact_person"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_type_id"], name: "index_institutions_on_institution_type_id"
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "short_name"
    t.string "code"
    t.bigint "organization_type_id"
    t.integer "parent_organization_unit_id"
    t.string "url"
    t.string "contact_person"
    t.string "contact_phone"
    t.string "contact_email"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_type_id"], name: "index_organization_units_on_organization_type_id"
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "country"
    t.bigint "institution_id"
    t.bigint "organization_unit_id"
    t.bigint "facility_id"
    t.bigint "user_id"
    t.string "job_title"
    t.bigint "profession_category_id"
    t.bigint "profession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_people_on_facility_id"
    t.index ["institution_id"], name: "index_people_on_institution_id"
    t.index ["organization_unit_id"], name: "index_people_on_organization_unit_id"
    t.index ["profession_category_id"], name: "index_people_on_profession_category_id"
    t.index ["profession_id"], name: "index_people_on_profession_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "petition_reviewing_committees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "government_body_id"
    t.bigint "sector_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["government_body_id"], name: "index_petition_reviewing_committees_on_government_body_id"
    t.index ["sector_id"], name: "index_petition_reviewing_committees_on_sector_id"
  end

  create_table "petitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "government_body_type_id"
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
    t.index ["government_body_type_id"], name: "index_petitions_on_government_body_type_id"
    t.index ["sector_id"], name: "index_petitions_on_sector_id"
  end

  create_table "pr_committee_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "pr_committee_id"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "profession"
    t.string "organization"
    t.text "about_the_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pr_committee_id"], name: "index_pr_committee_members_on_pr_committee_id"
  end

  create_table "pr_committees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "government_body_id"
    t.bigint "sector_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["government_body_id"], name: "index_pr_committees_on_government_body_id"
    t.index ["sector_id"], name: "index_pr_committees_on_sector_id"
  end

  create_table "profession_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "profession_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_category_id"], name: "index_professions_on_profession_category_id"
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sign_petitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "petition_id"
    t.string "full_name"
    t.string "email"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petition_id"], name: "index_sign_petitions_on_petition_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "role_id"
    t.string "user_name"
    t.integer "organization_unit_id"
    t.integer "facility_id"
    t.integer "institution_id"
    t.string "user_type"
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
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "facilities", "facility_types"
  add_foreign_key "facilities", "organization_units"
  add_foreign_key "government_bodies", "government_body_types"
  add_foreign_key "government_bodies", "regions"
  add_foreign_key "institutions", "institution_types"
  add_foreign_key "organization_units", "organization_types"
  add_foreign_key "people", "facilities"
  add_foreign_key "people", "institutions"
  add_foreign_key "people", "organization_units"
  add_foreign_key "people", "profession_categories"
  add_foreign_key "people", "professions"
  add_foreign_key "people", "users"
  add_foreign_key "petition_reviewing_committees", "government_bodies"
  add_foreign_key "petition_reviewing_committees", "sectors"
  add_foreign_key "petitions", "government_bodies"
  add_foreign_key "petitions", "government_body_types"
  add_foreign_key "petitions", "sectors"
  add_foreign_key "pr_committee_members", "pr_committees"
  add_foreign_key "pr_committees", "government_bodies"
  add_foreign_key "pr_committees", "sectors"
  add_foreign_key "professions", "profession_categories"
  add_foreign_key "sign_petitions", "petitions"
end
