class Student < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :skills
  attr_accessible :about, :interest, :name

  def self.search_by_name(query)
    # TODO: Avoid SQL injection!!
    Student.where("name like ?", "%#{query}%")
  end
end
