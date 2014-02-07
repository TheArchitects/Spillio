class Assignment < ActiveRecord::Base
  belongs_to :group
	belongs_to :task

	has_many :submissions, dependent: :destroy
	has_many :posts, dependent: :destroy

	delegate :title, :description, :due_date, :to => :task

  attr_accessible :id, :title, :due_date,:grade, :max_grade, :description, :group_id, :task_id, :ta_feedback

  def self.status_options
    [ :stand_by,  # The assignment is not visible to students untill activation time
      :active,    # The assignment is active and visible to students until due date
      :late,      # The assignment is open for submissions but the submissions will be tagged as late
      :past_due # The assignment is no longer submittable
      ]
  end

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

  def get_submissions_in_order
    submissions.order("label ASC")
  end
end
