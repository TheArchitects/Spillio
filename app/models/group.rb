class Group < ActiveRecord::Base

	has_and_belongs_to_many :assignments
	belongs_to :instructor
	belongs_to :section
	has_many :students
	has_many :scores
	has_many :submissions
	has_many :posts
	attr_accessible :group_name

  # TODO: Remove once we have isntructor functionality
  def self.create_group_with_mock_assignments(group_name)
    group = Group.create({group_name: group_name})
    group.assignments << Assignment.mock_assignment_1
    group.assignments << Assignment.mock_assignment_2
    group.save
    return group
  end

end
