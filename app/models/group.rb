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

    assignment_1 = Assignment.mock_assignment_1
    submission_1 = Submission.create({
      label: "Your credit card details plz",
      content: "Sure: 1234-1234-1324-1234",
      submitted_date: Date.parse('5-6-2006')
      })
    assignment_1.submissions << submission_1
    assignment_1.save
    group.submissions << submission_1
    group.assignments << assignment_1

    assignment_2 = Assignment.mock_assignment_2
    submission_2 = Submission.create({
      label: "Plz gimme the codez",
      })
    assignment_2.submissions << submission_2
    group.submissions << submission_2
    group.assignments << assignment_2

    group.save

    return group
  end

end
