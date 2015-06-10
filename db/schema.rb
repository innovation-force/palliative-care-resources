# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150609175205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories_concerns", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "concern_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories_concerns", ["category_id"], name: "index_categories_concerns_on_category_id", using: :btree
  add_index "categories_concerns", ["concern_id"], name: "index_categories_concerns_on_concern_id", using: :btree

  create_table "categories_services", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "service_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories_services", ["category_id"], name: "index_categories_services_on_category_id", using: :btree
  add_index "categories_services", ["service_id"], name: "index_categories_services_on_service_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "commenter"
    t.text     "body"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["service_id"], name: "index_comments_on_service_id", using: :btree

  create_table "concerns", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.boolean  "diagnosis"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "providers", force: :cascade do |t|
    t.text     "name"
    t.text     "organization"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "state"
    t.integer  "zip"
    t.text     "phone"
    t.text     "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "contact"
  end

  create_table "providers_services", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "service_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "providers_services", ["provider_id"], name: "index_providers_services_on_provider_id", using: :btree
  add_index "providers_services", ["service_id"], name: "index_providers_services_on_service_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "title"
    t.string   "req_type"
    t.string   "body"
    t.string   "parent_type"
    t.string   "parent_name"
    t.string   "user"
    t.string   "email"
    t.string   "note"
    t.boolean  "resolved"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "provider_id"
    t.integer  "refcount",    default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "approved",               default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
