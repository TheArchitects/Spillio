class Assignment < ActiveRecord::Base
  belongs_to :group
	belongs_to :task

	has_many :scores
	has_many :submissions
	has_many :posts

	delegate :title, :description, :due_date, :to => :task

  def self.create_from_group_and_task(group, task)
    assignment = Assignment.create()
    assignment.group = group
    assignment.task = task
    assignment.save
    return assignment
  end

  def posts_in_chronological_order
    posts = Post.where(:assignment_id => self.id)
                .order(:date => :asc)
  end
end
