class ProjectJoinRequest < ActiveRecord::Base
  attr_accessible :creation_time, :priority, :group_id, :project_id
  belongs_to :group
  belongs_to :project  

end 
