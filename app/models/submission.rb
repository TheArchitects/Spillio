class Submission < ActiveRecord::Base
  belongs_to :assignment
  attr_accessible :label, :content, :submitted_date
end
