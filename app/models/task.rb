class Task < ActiveRecord::Base
  has_many :assignments
  attr_accessible :id, :title, :description, :due_date


  def assign_to_all_groups(max_grade, submission_types, submission_labels)
    Group.all.each do |group|
      assignment = Assignment.create_from_group_and_task(group, self)
      assignment.max_grade = max_grade
      assignment.save

      0.upto(submission_types.length-1) do |i|
        label = submission_labels[i]
        type = submission_types[i]
        submission = Submission.create!(:label => label, :subm_type => type)
        submission.assignment = assignment
        submission.save
      end
    end
  end

  # TODO: Remove once we have instructor functionality
  def self.mock_task_1
    unless defined? @@mock_task_1
      @@mock_task_1 = Task.create({
        title: "Ye olde iteration",
        description: "Lorem ipsum dolor sit amet, "*8,
        due_date: Date.parse('6-6-2006')
        })
    end
    @@mock_task_1
  end

  def self.mock_task_2
    unless defined? @@mock_task_2
      @@mock_task_2 = Task.create({
        title: "Upcoming iteration",
        description: "Anim pariatur cliche reprehenderit, "*8,
        due_date: Date.parse('6-6-2016')
        })
    end
    @@mock_task_2
  end
end