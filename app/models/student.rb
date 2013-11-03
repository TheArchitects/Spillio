class Student < ActiveRecord::Base
  belongs_to :group :section
  has_and_belongs_to_many :courses :skills 
  has_many :notifications :posts

  attr_accessible :about, :interest, :name, :cid

  def self.search_by_name(query, page)
    # TODO: Avoid SQL injection!!
    query = query.downcase
    sql_query = Student.where("lower(name) like ?", "%#{query}%")
    return Student.num_pages_from_query(sql_query), sql_query.paginate(:per_page => 20, :page => page)
  end

  private
  def self.num_pages_from_query(query)
    total_res = query.count
    1 + (total_res-1) / 20
  end
end
