class ProjectJoinRequest < ActiveRecord::Base
  attr_accessible :requestee, :requester, :creation_time, :priority, :group_id, :project_id

end 
