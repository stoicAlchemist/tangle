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

ActiveRecord::Schema.define(version: 20180902012734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.boolean "hidden", default: false
    t.boolean "flagged", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commentable_id"
    t.string "commentable_type"
    t.bigint "creator_id", default: 1, null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["creator_id"], name: "index_comments_on_creator_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", default: 1, null: false
    t.index ["creator_id"], name: "index_domains_on_creator_id"
  end

  create_table "efforts", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "role", default: "Undefined", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.text "goal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_id"
    t.bigint "project_type_id", default: 1, null: false
    t.string "icon", default: "folder", null: false
    t.bigint "creator_id", default: 1, null: false
    t.index ["creator_id"], name: "index_projects_on_creator_id"
    t.index ["domain_id"], name: "index_projects_on_domain_id"
    t.index ["project_type_id"], name: "index_projects_on_project_type_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done", default: false, null: false
    t.string "bootstrap_color", default: "secondary", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0, null: false
    t.bigint "status_id", default: 1
    t.bigint "effort_id", default: 1
    t.bigint "project_id"
    t.bigint "parent_id"
    t.bigint "creator_id", default: 1, null: false
    t.index ["creator_id"], name: "index_tasks_on_creator_id"
    t.index ["effort_id"], name: "index_tasks_on_effort_id"
    t.index ["parent_id"], name: "index_tasks_on_parent_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["status_id"], name: "index_tasks_on_status_id"
    t.index ["title"], name: "index_tasks_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", default: "", null: false
  end

  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "domains", "users", column: "creator_id"
  add_foreign_key "projects", "project_types"
  add_foreign_key "projects", "users", column: "creator_id"
  add_foreign_key "tasks", "efforts"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "statuses"
  add_foreign_key "tasks", "tasks", column: "parent_id"
  add_foreign_key "tasks", "users", column: "creator_id"
end
