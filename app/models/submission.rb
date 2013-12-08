class Submission < ActiveRecord::Base
  belongs_to :assignment
  attr_accessible :label, :subm_type, :content, :submitted_date, :assignment_id
end
