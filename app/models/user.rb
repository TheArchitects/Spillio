class User < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :skills
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
    
  end


  # Instance methods
  def is_student?
    return type == 'Student'
  end

  def is_instructor?
    return type == 'Instructor'
  end

  private
  def self.num_pages_from_query(query)
    total_res = query.count
    1 + (total_res-1) / 20
  end
end
