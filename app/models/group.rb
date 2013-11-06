class Group < ActiveRecord::Base
<<<<<<< HEAD
	has_and_belongs_to_many :assignments
	belongs_to :instructor
	belongs_to :section
	has_many :students
	has_many :scores
	has_many :submissions
	has_many :posts
	attr_accessible :group_name
=======
  belongs_to :owner, class_name: "Student"
  belongs_to :gsi, class_name: "Student"
  
  belongs_to :project
  belongs_to :course
  has_many :students
  has_many :posts
  
  attr_accessible :member_limit, :name, :project, :course
>>>>>>> f54d386e83e4db1b209a9f8db45b1c177b733f6e
end
