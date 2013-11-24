class Student < User
  belongs_to :group
  has_many :group_join_requests
  attr_accessible :id, :name, :group_id

  def self.create_or_update(student_edit_form_data, cas_id)
  	student = find_by_cid(cas_id) || Student.new

  	student.name = student_edit_form_data[:name]
  	student.about = student_edit_form_data[:about]
  	student.email = student_edit_form_data[:email]
    student.interest = student_edit_form_data[:interest]
    student.cid = cas_id

    student.section = Section.find(student_edit_form_data[:section_id])
    student.skills << Skill.find(student_edit_form_data[:skill_ids])
    student.courses << Course.find(student_edit_form_data[:course_ids])
    student.save

    if not student.group_id
		  student_group = Group.new
	    student_group.group_name = "#{student.name}'s Group"
	    student_group.students << student
	    student_group.save
    end

    return student
  end

  # Checks if this student can potentially be joined in a group by another
	def joinable_by?(other_student)
	  # False if self doesn't have a group or self equals the other student
	  return (
	      (not other_student == self)
	    )
	end
end
