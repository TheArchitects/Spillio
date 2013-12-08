class Submission < ActiveRecord::Base
  belongs_to :assignment
  attr_accessible :label, :content, :submitted_date, :assignment_id, :subm_type

  def max_grade
    self.assignment.max_grade
  end
end
