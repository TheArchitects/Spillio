class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "Student"
  belongs_to :gsi, class_name: "Student"
  
  belongs_to :project
  belongs_to :course
  has_many :students
  has_many :posts
  
  attr_accessible :member_limit, :name, :project, :course
end
