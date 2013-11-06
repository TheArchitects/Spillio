class Instructor < User
  # attr_accessible :title, :body
	has_many :groups
	has_many :assignments
end
