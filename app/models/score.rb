class Score < ActiveRecord::Base
  belongs_to :assignment
  attr_accessible :max_score, :score, :id, :assignment_id
end
