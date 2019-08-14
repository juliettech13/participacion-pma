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

ActiveRecord::Schema.define(version: 2019_08_14_194333) do

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
    t.bigint "consultation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultation_id"], name: "index_answers_on_consultation_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "articles", force: :cascade do |t|
    t.text "content"
    t.integer "number"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new"
    t.index ["chapter_id"], name: "index_articles_on_chapter_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "description"
    t.integer "number"
    t.bigint "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new", default: false
    t.index ["title_id"], name: "index_chapters_on_title_id"
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
    t.string "content"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_metadata_on_article_id"
  end

  create_table "metadatum_subarticles", force: :cascade do |t|
    t.string "content"
    t.integer "number"
    t.bigint "metadatum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metadatum_id"], name: "index_metadatum_subarticles_on_metadatum_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_questions_on_article_id"
  end

  create_table "subarticles", force: :cascade do |t|
    t.text "content"
    t.integer "number"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_subarticles_on_article_id"
  end

  create_table "subsubarticles", force: :cascade do |t|
    t.text "content"
    t.integer "number"
    t.bigint "subarticle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subarticle_id"], name: "index_subsubarticles_on_subarticle_id"
  end

  create_table "titles", force: :cascade do |t|
    t.integer "number"
    t.text "description"
    t.bigint "legislation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new", default: false
    t.index ["legislation_id"], name: "index_titles_on_legislation_id"
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

  add_foreign_key "answers", "consultations"
  add_foreign_key "answers", "questions"
  add_foreign_key "articles", "chapters"
  add_foreign_key "chapters", "titles"
  add_foreign_key "consultations", "legislations"
  add_foreign_key "consultations", "users"
  add_foreign_key "general_feedbacks", "consultations"
  add_foreign_key "legislations", "users"
  add_foreign_key "metadata", "articles"
  add_foreign_key "metadatum_subarticles", "metadata"
  add_foreign_key "questions", "articles"
  add_foreign_key "subarticles", "articles"
  add_foreign_key "subsubarticles", "subarticles"
  add_foreign_key "titles", "legislations"
end
