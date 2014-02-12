class Student < User
  belongs_to :group
  has_many :group_join_requests
  has_and_belongs_to_many :courses
  has_many :skills
  attr_accessible :id, :name, :group_id

  def self.create_or_update(student_edit_form_data, cas_id)
  	student = find_by_cid(cas_id) || Student.new

  	student.name = student_edit_form_data[:name]
  	student.about = student_edit_form_data[:about]
  	student.email = student_edit_form_data[:email]
    student.interest = student_edit_form_data[:interest]
    student.class_account = student_edit_form_data[:class_account]
    student.cid = cas_id

    unless student_edit_form_data[:section_id].nil?
      student.section = Section.find(student_edit_form_data[:section_id])
    end

    unless student_edit_form_data[:course_ids].nil?
      student.add_courses(student_edit_form_data[:course_ids])
    end

    unless student_edit_form_data[:skill_names].nil?
      student.add_skills(student_edit_form_data[:skill_names].split(','))
    end
    
    student.save

    if not student.group_id
		  student_group = Group.new
	    student_group.group_name = "#{student.name}'s Group"
	    student_group.students << student
	    student_group.save
    end

    return student
  end

  def self.enough_fields?(hash, student_cid)
    hash[:name] != '' && hash[:about] != '' && student_cid!=nil
  end

  def add_courses(course_ids)
    course_ids.each do |course_id|
      course = Course.find(course_id)
      unless self.courses.include? course
        self.courses << course
        self.save
      end
    end
  end

  def add_skills(skill_names)
    skill_names.each do |skill_name|
      unless self.skills.any? { |skill| skill.name == skill_name}
        self.skills << Skill.create(:name => skill_name)
        self.save
      end
    end
  end

  def skill_names
    skill_names= ""
    if skills.count > 0
      skills.each do |sk|
        skill_names += "#{sk.name}, "
      end
      skill_names.chop!.chop!
    end
    skill_names
  end

  # Checks if this student can potentially be joined in a group by another
	def joinable_by?(other_student)
	  return (
	      (not other_student == self) and #can not invite/merge/join  yourself
        (other_student.is_admin?) and # admin can not invite/merge/join to anyone
        (not is_reader?) # can not invite/merge/join with a reader
	    )
	end

  def gravatar_url
    email = self.email || "" #Possibly get the email with @student.email
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=300"
  end

  def get_student_title
    if self.is_reader?
      "reader"
    end
  end

end
