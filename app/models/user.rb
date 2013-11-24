class User < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :courses
  has_many :skills
  attr_accessible :about, :interest, :name, :cid, :type

  def self.search_by_name(query, page)
    # TODO: Avoid SQL injection!!
    query = query.downcase
    sql_query = Student.where("lower(name) like ?", "%#{query}%")
    return Student.num_pages_from_query(sql_query), sql_query.paginate(:per_page => 20, :page => page)
  end

  # Creates a User model for the authenticated user
  def self.create_for_current_user!(s, current_user_id)
    # TODO: Check if instructor
    student = Student.create(:name => s[:name], :about => s[:about],
        :interest => s[:interest], :cid => current_user_id)
    student.section = Section.find(s[:section_id])
    student.skills << Skill.find(s[:skill_ids])
    student.courses << Course.find(s[:course_ids])
    student.save

    group_name = "#{student.name}'s group"

    student_group = Group.create_group_with_mock_assignments(group_name)
    student_group.students << student
    student_group.save

    return student
  end

  def self.exists_with_cid? cid
    find_by_cid(cid)!=nil
  end


  # Instance methods
  def is_student?
    return type == 'Student'
  end

  def is_instructor?
    return type == 'Instructor'
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

  def create_and_add_skills_by_name(skill_list)
    skill_list.split(",").each do |sk|
      self.skills << Skill.create(:name => sk)
    end
  end

  def incoming_group_requests
    GroupJoinRequest.where(:requestee_id => self)
  end



  private
  def self.num_pages_from_query(query)
    total_res = query.count
    1 + (total_res-1) / 20
  end
end
