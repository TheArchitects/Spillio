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

ActiveRecord::Schema.define(:version => 20131110184834) do

  create_table "assignments", :force => true do |t|
    t.integer  "group_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "assignments", ["group_id"], :name => "index_assignments_on_group_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "courses", ["name"], :name => "index_courses_on_name", :unique => true

  create_table "courses_users", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  add_index "courses_users", ["course_id", "user_id"], :name => "index_courses_users_on_course_id_and_user_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.integer  "instructor_id"
    t.integer  "section_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "groups", ["instructor_id"], :name => "index_groups_on_instructor_id"
  add_index "groups", ["section_id"], :name => "index_groups_on_section_id"

  create_table "posts", :force => true do |t|
    t.datetime "date"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "posts", ["assignment_id"], :name => "index_posts_on_assignment_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "scores", :force => true do |t|
    t.decimal  "score"
    t.decimal  "max_score"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "scores", ["assignment_id"], :name => "index_scores_on_assignment_id"

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

  create_table "skills_users", :id => false, :force => true do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  add_index "skills_users", ["skill_id", "user_id"], :name => "index_skills_users_on_skill_id_and_user_id", :unique => true

  create_table "submissions", :force => true do |t|
    t.string   "label"
    t.text     "content"
    t.datetime "submitted_date"
    t.integer  "assignment_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "submissions", ["assignment_id"], :name => "index_submissions_on_assignment_id"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "due_date"
    t.integer  "author_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tasks", ["author_id"], :name => "index_tasks_on_author_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "section_id"
    t.string   "interest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cid"
    t.string   "type"
    t.integer  "group_id"
  end

  add_index "users", ["group_id"], :name => "index_users_on_group_id"
  add_index "users", ["section_id"], :name => "index_users_on_section_id"

end
