class User < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :courses
  has_many :skills
  attr_accessible :about, :interest, :name, :cid

  def self.search_by_name(query, page)
    # TODO: Avoid SQL injection!!
    query = query.downcase
    sql_query = Student.where("lower(name) like ?", "%#{query}%")
    return Student.num_pages_from_query(sql_query), sql_query.paginate(:per_page => 20, :page => page)
  end

  def self.exists_with_cid? cid
    find_by_cid(cid)!=nil
  end


  # Instance methods

  def incoming_group_requests
    GroupJoinRequest.where(:requestee_id => self)
  end

  def self.get_readers
    User.where(:is_reader=>true)
  end

  def make_reader
    self.is_reader = true
    self.save
  end


  private
  def self.num_pages_from_query(query)
    total_res = query.count
    1 + (total_res-1) / 20
  end
end
