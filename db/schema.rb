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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131027215357) do

  create_table "announcements", :force => true do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "active"
    t.text     "roles"
    t.text     "types"
    t.text     "style"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "courses", ["name"], :name => "index_courses_on_name", :unique => true

  create_table "courses_students", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  add_index "courses_students", ["course_id", "student_id"], :name => "index_courses_students_on_course_id_and_student_id", :unique => true

  create_table "fb_users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sections", ["number"], :name => "index_sections_on_number", :unique => true

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "skills", ["name"], :name => "index_skills_on_name", :unique => true

  create_table "skills_students", :id => false, :force => true do |t|
    t.integer "skill_id"
    t.integer "student_id"
  end

  add_index "skills_students", ["skill_id", "student_id"], :name => "index_skills_students_on_skill_id_and_student_id", :unique => true

  create_table "students", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "section_id"
    t.string   "interest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "students", ["section_id"], :name => "index_students_on_section_id"

  create_table "users", :force => true do |t|
    t.string   "uid",             :limit => 10,                     :null => false
    t.string   "first_name",      :limit => 60
    t.string   "last_name",       :limit => 60
    t.string   "first_last_name", :limit => 100
    t.string   "email",           :limit => 256
    t.string   "phone",           :limit => 30
    t.boolean  "inactive",                       :default => false, :null => false
    t.boolean  "admin",                          :default => false, :null => false
    t.datetime "last_login_at"
    t.datetime "last_request_at"
    t.datetime "last_logout_at"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true

end
