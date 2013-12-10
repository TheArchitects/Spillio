class ProjectJoinRequest < ActiveRecord::Base
  attr_accessible :requestee, :requester, :creation_time, :priority, :group_id, :project_id
  belongs_to :group
  belongs_to :project
  attr_accessor :group, :project
  

end 
