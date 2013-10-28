class SkillsStudents < ActiveRecord::Migration
  def up
  	create_table :skills_students, :id => false do |t|
  		t.references :skill
  		t.references :student
  	end
  	add_index :skills_students, [:skill_id, :student_id], :unique => true
  end

  def down
  	drop_table :skills_students
  end
end
