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

ActiveRecord::Schema.define(version: 20200813090906) do

  create_table "attendances", force: true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "date"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["student_id"], name: "index_attendances_on_student_id", using: :btree
  add_index "attendances", ["subject_id"], name: "index_attendances_on_subject_id", using: :btree

  create_table "standards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.integer  "roll_number"
    t.integer  "standard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["standard_id"], name: "index_students_on_standard_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "standard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["standard_id"], name: "index_subjects_on_standard_id", using: :btree

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
