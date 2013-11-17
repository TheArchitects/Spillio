class Request < ActiveRecord::Base

  belongs_to :requseting_student
  belongs_to :requested_student

end
