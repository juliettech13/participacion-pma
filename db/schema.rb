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

ActiveRecord::Schema.define(version: 2018_09_19_214313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "clauses", force: :cascade do |t|
    t.string "content"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_clauses_on_section_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.bigint "legislation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legislation_id"], name: "index_consultations_on_legislation_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "general_feedbacks", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "consultation_id"
    t.index ["consultation_id"], name: "index_general_feedbacks_on_consultation_id"
  end

  create_table "legislations", force: :cascade do |t|
    t.string "title"
    t.text "introduction"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_legislations_on_user_id"
  end

  create_table "metadata", force: :cascade do |t|
    t.text "vision"
    t.string "agency"
    t.string "rationale"
    t.text "status"
    t.bigint "clause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clause_id"], name: "index_metadata_on_clause_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.bigint "clause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clause_id"], name: "index_questions_on_clause_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "legislation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legislation_id"], name: "index_sections_on_legislation_id"
  end

  create_table "subclauses", force: :cascade do |t|
    t.text "content"
    t.bigint "clause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clause_id"], name: "index_subclauses_on_clause_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "clauses", "sections"
  add_foreign_key "consultations", "legislations"
  add_foreign_key "consultations", "users"
  add_foreign_key "general_feedbacks", "consultations"
  add_foreign_key "legislations", "users"
  add_foreign_key "metadata", "clauses"
  add_foreign_key "questions", "clauses"
  add_foreign_key "sections", "legislations"
  add_foreign_key "subclauses", "clauses"
end
