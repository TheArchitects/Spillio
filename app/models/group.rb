class Group < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :section
  has_many :students
	has_many :assignments
  has_many :group_join_requests
	attr_accessible :group_name
  attr_accessible :id, :instructor_id

  before_create :default_values

  @@max_students = 6

  def num_students
    self.students.count
  end

  def self.max_students
    @@max_students
  end

  def self.max_students=(max)
    @@max_students = max
  end

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
    score_1 = Score.create({:max_score => 20, :score => 10})
    assignment_1.scores << score_1
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

    else
      # group size exceeded
      return false
    end
    # successful merge
    return merged_group.id
  end

  private
  def default_values
    self.max_size ||= Setting.first.max_group_size
  end
end
