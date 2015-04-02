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

ActiveRecord::Schema.define(version: 20141208070155) do

# Could not dump table "comments" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
  end

  create_table "families", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hobbies", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  create_table "images", force: true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.string   "filename"
    t.integer  "member_id"
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["comment_id"], name: "index_likes_on_comment_id"
  add_index "likes", ["image_id"], name: "index_likes_on_image_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Member"
    t.integer  "family_id"
  end

  add_index "members", ["family_id"], name: "index_members_on_family_id"

  create_table "milestones", force: true do |t|
    t.string   "date"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  create_table "relationships", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_one"
    t.integer  "member_two"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["image_id"], name: "index_tags_on_image_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "family_name"
    t.integer  "family_key"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
