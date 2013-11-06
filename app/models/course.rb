class Course < ActiveRecord::Base
<<<<<<< HEAD
	has_and_belongs_to_many :students
	attr_accessible :name
=======
  has_and_belongs_to_many :students
  has_many :sections, :groups
  attr_accessible :name
>>>>>>> f54d386e83e4db1b209a9f8db45b1c177b733f6e
end
