class Course < ActiveRecord::Base
	has_and_belongs_to_many :students
	has_many :sections, :groups
	attr_accessible :name
end
