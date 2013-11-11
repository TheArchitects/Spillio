class Group < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :section
  has_many :students
	has_many :assignments

	attr_accessible :group_name

  # TODO: Remove once we have isntructor functionality
  def self.create_group_with_mock_assignments(group_name)
    group = Group.create({group_name: group_name})

    task_1 = Task.mock_task_1
    assignment_1 = Assignment.create_from_group_and_task(group, task_1)
    submission_1 = Submission.create({
      label: "Your credit card details plz",
      content: "Sure: 1234-1234-1324-1234",
      submitted_date: Date.parse('5-6-2006')
      })
    assignment_1.submissions << submission_1
    assignment_1.save

    task_2 = Task.mock_task_2
    assignment_2 = Assignment.create_from_group_and_task(group, task_2)
    submission_2 = Submission.create({
      label: "Plz gimme the codez",
      })
    assignment_2.submissions << submission_2
    assignment_2.save

    return group
  end

end
