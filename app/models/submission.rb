class Submission < ActiveRecord::Base
  belongs_to :assignment
  attr_accessible :label, :content, :submitted_date, :assignment_id, :subm_type

  def max_grade
    self.assignment.max_grade
  end

  def self.possible_submission_types
    {text_field: "Text Field",text_area: "Text Area",file: "File"}
  end
end
