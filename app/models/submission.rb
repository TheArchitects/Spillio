class Submission < ActiveRecord::Base
  belongs_to :group
  belongs_to :assignment
  attr_accessible :content, :submitted_date
end
