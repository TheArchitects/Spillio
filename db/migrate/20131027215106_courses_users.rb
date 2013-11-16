class CoursesUsers < ActiveRecord::Migration
  def up
  	create_table :courses_users, :id => false do |t|
  		t.references :course
  		t.references :user
  	end
  	add_index :courses_users, [:course_id, :user_id], :unique => true
  end

  def down
  	drop_table :courses_users
  end
end
