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

ActiveRecord::Schema.define(version: 20140314134027) do

  create_table "contributor_recipes", force: true do |t|
    t.integer  "contributor_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "quantity"
    t.string   "photo"
    t.string   "size"
    t.text     "description"
    t.integer  "recipe_id"
    t.integer  "status_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["recipe_id"], name: "index_materials_on_recipe_id", using: :btree
  add_index "materials", ["status_id"], name: "index_materials_on_status_id", using: :btree

  create_table "recipe_tags", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_tags", ["recipe_id"], name: "index_recipe_tags_on_recipe_id", using: :btree
  add_index "recipe_tags", ["tag_id"], name: "index_recipe_tags_on_tag_id", using: :btree

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "repo_path"
    t.string   "title"
    t.string   "type"
    t.text     "description"
    t.string   "photo"
    t.string   "youtube_url"
    t.integer  "user_id"
    t.integer  "last_committer_id"
    t.integer  "orig_recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.integer  "prev_id"
    t.integer  "position"
    t.text     "description"
    t.string   "photo"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statuses", ["recipe_id"], name: "index_statuses_on_recipe_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "photo"
    t.text     "description"
    t.integer  "recipe_id"
    t.integer  "way_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tools", ["recipe_id"], name: "index_tools_on_recipe_id", using: :btree
  add_index "tools", ["way_id"], name: "index_tools_on_way_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "group_id"
    t.integer  "contributing_recipe_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "ways", force: true do |t|
    t.string   "name"
    t.string   "photo"
    t.integer  "status_id"
    t.integer  "recipe_id"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ways", ["recipe_id"], name: "index_ways_on_recipe_id", using: :btree
  add_index "ways", ["status_id"], name: "index_ways_on_status_id", using: :btree

end
