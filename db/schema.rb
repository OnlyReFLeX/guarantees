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

ActiveRecord::Schema.define(version: 20180704122400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boilers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calls", force: :cascade do |t|
    t.string "username"
    t.string "phone"
    t.text "adress"
    t.date "call_date"
    t.string "status", default: "expect"
    t.string "error"
    t.text "whycanceled"
    t.text "infosuccess"
    t.boolean "guarantee"
    t.text "comment"
    t.bigint "product_model_id"
    t.bigint "user_id"
    t.bigint "master_id"
    t.bigint "warranty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_calls_on_master_id"
    t.index ["product_model_id"], name: "index_calls_on_product_model_id"
    t.index ["user_id"], name: "index_calls_on_user_id"
    t.index ["warranty_id"], name: "index_calls_on_warranty_id"
  end

  create_table "masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_models", force: :cascade do |t|
    t.string "name"
    t.bigint "boiler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boiler_id"], name: "index_product_models_on_boiler_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "type", default: "User"
    t.bigint "call_id"
    t.bigint "warranty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "design", default: 0
    t.index ["call_id"], name: "index_users_on_call_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["warranty_id"], name: "index_users_on_warranty_id"
  end

  create_table "warranties", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "adress"
    t.date "datefirststart"
    t.date "datebuyed"
    t.boolean "started"
    t.text "comment"
    t.string "serial"
    t.bigint "product_model_id"
    t.bigint "master_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_warranties_on_master_id"
    t.index ["product_model_id"], name: "index_warranties_on_product_model_id"
    t.index ["user_id"], name: "index_warranties_on_user_id"
  end

  add_foreign_key "product_models", "boilers"
end
