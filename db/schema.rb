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

ActiveRecord::Schema.define(:version => 20131105235205) do

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

  create_table "assignments", :force => true do |t|
    t.text     "description"
    t.datetime "due_date"
    t.integer  "instructor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "assignments", ["instructor_id"], :name => "index_assignments_on_instructor_id"

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

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.integer  "instructor_id"
    t.integer  "section_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "groups", ["instructor_id"], :name => "index_groups_on_instructor_id"
  add_index "groups", ["section_id"], :name => "index_groups_on_section_id"

  create_table "hidden_announcements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "announcement_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "hidden_announcements", ["announcement_id"], :name => "index_hidden_announcements_on_announcement_id"
  add_index "hidden_announcements", ["user_id"], :name => "index_hidden_announcements_on_user_id"

  create_table "instructors", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.datetime "date"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "posts", ["assignment_id"], :name => "index_posts_on_assignment_id"
  add_index "posts", ["group_id"], :name => "index_posts_on_group_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "scores", :force => true do |t|
    t.decimal  "score"
    t.decimal  "max_score"
    t.integer  "group_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "scores", ["assignment_id"], :name => "index_scores_on_assignment_id"
  add_index "scores", ["group_id"], :name => "index_scores_on_group_id"

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

  create_table "submissions", :force => true do |t|
    t.text     "content"
    t.datetime "submitted_date"
    t.integer  "group_id"
    t.integer  "assignment_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "submissions", ["assignment_id"], :name => "index_submissions_on_assignment_id"
  add_index "submissions", ["group_id"], :name => "index_submissions_on_group_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "section_id"
    t.string   "interest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cid"
  end

  add_index "users", ["section_id"], :name => "index_students_on_section_id"

end
