class Submission < ActiveRecord::Base
  belongs_to :group
  belongs_to :assignment
  attr_accessible :label, :content, :submitted_date
end
