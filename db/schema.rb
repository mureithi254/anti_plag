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

ActiveRecord::Schema.define(version: 20170401071600) do

  create_table "docs", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "attachment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_docs_on_user_id"
  end

  create_table "plags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
    t.string   "filename"
    t.integer  "user_id"
    t.integer  "doc_id"
    t.integer  "doc"
    t.integer  "user"
    t.index ["doc_id"], name: "index_plags_on_doc_id"
    t.index ["user_id"], name: "index_plags_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.text     "plagiarised_content"
    t.integer  "user_id"
    t.integer  "doc_id"
    t.integer  "plag_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["doc_id"], name: "index_results_on_doc_id"
    t.index ["plag_id"], name: "index_results_on_plag_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
