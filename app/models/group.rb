class Group < ActiveRecord::Base
  belongs_to :reader, :class_name => "Student"
  belongs_to :section
  has_many :students
	has_many :assignments
  has_many :group_join_requests
	attr_accessible :group_name
  attr_accessible :id

  # TODO Clean up max_students mess: we have them like three times
  def num_students
    self.students.count
  end

  def self.max_students
    Setting.first.max_group_size
  end

  def self.max_students=(max)
    Setting.first.max_group_size = max
  end

  # TODO: Better name
  def self.get_groups_for(reader_id)
    self.where(reader_id: reader_id)
  end

  # TODO: Remove once we have isntructor functionality
  # TODO: OR at least fix grade/score bug
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

  def self.delete_if_empty(group_id)
    if Group.exists? group_id
      group = Group.find group_id
      if group.students.count == 0
        group.destroy
      end
    end
  end

  def size
    self.students.count
  end

  def self.merge_groups(group1_id, group2_id)
    group1 = Group.find(group1_id)
    group2 = Group.find(group2_id)

    if group1.size + group2.size < Setting.first.max_group_size
      merged_group = Group.create(group_name: group2.group_name)

      group1.students.each do |s|
        s.group_id = merged_group.id
        s.save
      end

      group2.students.each do |s|
        s.group_id = merged_group.id
        s.save
      end

      # successful merge
      return merged_group.id
    else
      # group size exceeded
      return false
    end
  end


  # Instance methods
  def max_size
    Setting.first.max_group_size
  end

  def assignments_in_order
    self.assignments.sort! {|a,b| a.due_date <=> b.due_date}
  end
end
