class User < ActiveRecord::Base
  belongs_to :section


  attr_accessible :about, :interest, :name, :cid
  after_create :make_admin, if: :first_user?

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

  def make_admin
    if not self.is_admin?
      old_group = self.group 
      self.is_admin = true
      admins_group = Group.find_by_group_name("Admins")
      admins_group.students << self
      Group.delete_if_empty(old_group.id) if old_group
      self.save
    end
  end
  
  private

  def self.num_pages_from_query(query)
    total_res = query.count
    1 + (total_res-1) / 20
  end

  def first_user?
    self.id==1
  end
end
