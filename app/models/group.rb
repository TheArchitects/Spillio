class Group < ActiveRecord::Base
  belongs_to :reader, :class_name => "Student"
  belongs_to :section
  has_one :project
  has_many :students
  has_many :assignments
  has_many :project_join_requests
  attr_accessible :group_name, :id, :max_size
  after_initialize :set_defaults
  after_create :add_assignments

  # TODO Clean up max_students mess: we have them like three times
  def num_students
    self.students.count
  end

  # TODO: Better name
  def self.get_groups_for(reader_id)
    self.where(reader_id: reader_id)
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

    if group1.size + group2.size < group2.max_size

      group1.students.each do |s|
        s.group_id = group2.id
        s.save
      end

      group1.destroy
      # successful merge
      return group2.id
    else
      # group size exceeded
      return false
    end
  end


  # Instance methods

  def assignments_in_order
    #self.assignments.sort_by :due_date
    self.assignments.sort! {|a,b| a.due_date <=> b.due_date}
  end

  def set_defaults
    self.max_size ||= Setting.first.max_group_size
  end

  def add_assignments
    Task.all.each do |task|
      sample_assignment = Assignment.find_by_task_id(task.id)

      assignment = Assignment.create_from_group_and_task(self, task)
      assignment.max_grade = sample_assignment.max_grade
      assignment.save

      sample_assignment.submissions.each do |submission|
        new_submission = Submission.create!(:label => submission.label, :subm_type => submission.subm_type)
        new_submission.assignment = assignment
        new_submission.save
      end
    end
  end
end
