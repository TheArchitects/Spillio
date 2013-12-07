class Assignment < ActiveRecord::Base
  belongs_to :group
	belongs_to :task

	has_many :submissions
	has_many :posts

	delegate :title, :description, :due_date, :to => :task

  attr_accessible :id, :title, :due_date, :grade, :max_grade, :description, :group_id, :task_id
  def self.create_from_group_and_task(group, task)
    assignment = Assignment.create()
    assignment.group = group
    assignment.task = task
    assignment.save
    return assignment
  end

  def posts_in_chronological_order
    posts = Post.where(:assignment_id => self.id)
                .order("published_at ASC")
  end
end
