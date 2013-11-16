class Group < ActiveRecord::Base

	has_and_belongs_to_many :assignments
	belongs_to :instructor
	belongs_to :section
	has_many :students
	has_many :scores
	has_many :submissions
	has_many :posts
	attr_accessible :group_name
  attr_accessible :id, :instructor_id

end
