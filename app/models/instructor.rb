class Instructor < User
  attr_accessible :id, :name
	has_many :groups
	has_many :assignments
end
