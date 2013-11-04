class Student < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :skills
  attr_accessible :about, :interest, :name, :cid

  def self.search_by_name(query, page)
    # TODO: Avoid SQL injection!!
    query = query.downcase
    sql_query = Student.where("lower(name) like ?", "%#{query}%")
    return Student.num_pages_from_query(sql_query), sql_query.paginate(:per_page => 20, :page => page)
  end

  def self.create_for_current_user!(s, current_user_id)
    student = Student.create(:name => s[:name], :about => s[:about],
        :interest => s[:interest], :cid => current_user_id)
    student.section = Section.find(s[:section_id])
    student.skills << Skill.find(s[:skill_ids])
    student.courses << Course.find(s[:course_ids])
    student.save

    return student
  end

  private
  def self.num_pages_from_query(query)
    total_res = query.count
    1 + (total_res-1) / 20
  end
end
